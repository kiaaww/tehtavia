#ifndef BALANCE_H
#define BALANCE_H

#include <QLabel>
#include <QString>
#include <QDialog>
#include <QNetworkAccessManager>
#include <QtNetwork>
#include <QJsonDocument>

namespace Ui {
class balance;
}

class balance : public QDialog
{
    Q_OBJECT

public:
    explicit balance(QWidget *parent = nullptr);
    ~balance();

    void info();

    QString getFname() const;
    void setFname(const QString &newFname);

    QString getLname() const;
    void setLname(const QString &newLname);

    void setType(const QString &accType);

    void setIdaccount(const QString &accId);

    void setBalance(const QString &accBalance);

signals:
    void CloseApp();

private slots:
    void closebtn_handler();

private:
    Ui::balance *ui;
    QNetworkAccessManager *loginManager;
    QNetworkReply *reply;
    QByteArray response_data;
    QString Fname;
    QString Lname;
    QLabel *IdLabel;
    QLabel *TypeLabel;
    QLabel *BalanceLabel;

};

#endif // BALANCE_H
