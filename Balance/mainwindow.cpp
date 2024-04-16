#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "balance.h"

#include <QMessageBox>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(ui->pushButton, &QPushButton::clicked, this, &MainWindow::btn_balance_handler);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::btn_balance_handler()
{
    QString idaccount = ui->lineEdit->text();
    accountID = idaccount;

    QString site_url = "http://localhost:3000/account?id=" + idaccount;

    QNetworkRequest request((site_url));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    loginManager = new QNetworkAccessManager(this);
    connect(loginManager, SIGNAL(finished(QNetworkReply*)),this, SLOT(accountSlot(QNetworkReply*)));
    reply = loginManager->get(request);

    qDebug() << "Request for account: " << idaccount;
}

void MainWindow::accountSlot(QNetworkReply *reply)
{
    response_data = reply->readAll();
    QMessageBox msgBox;

    qDebug() << response_data;

        QString accId;
        QString accType;
        QString accBalance;

        disconnect(loginManager, SIGNAL(finished(QNetworkReply*)),
                   this, SLOT(accountSlot(QNetworkReply*)));
        this->close();

        qDebug() << "AccountID on: " << accountID;

        balance *see_balance = new balance(this);

        see_balance->setIdaccount(accId);
        see_balance->setType(accType);
        see_balance->setBalance(accBalance);

        see_balance->show();

    reply->deleteLater();
}
