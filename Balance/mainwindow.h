#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "qnetworkreply.h"
#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

public slots:
    void accountSlot(QNetworkReply *reply);

private slots:
    void btn_balance_handler();

private:
    Ui::MainWindow *ui;
    QNetworkAccessManager *loginManager;
    QNetworkReply *reply;
    QByteArray response_data;
    QString accountID;
};
#endif // MAINWINDOW_H
