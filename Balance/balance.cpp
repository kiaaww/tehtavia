#include "balance.h"
#include "ui_balance.h"

#include <QLabel>
#include <QString>

balance::balance(QWidget *parent)
    : QDialog(parent)
    , ui(new Ui::balance)
{
    ui->setupUi(this);

    connect(ui->closebtn, &QPushButton::clicked, this, &balance::closebtn_handler);

    TypeLabel = new QLabel(this);
    BalanceLabel = new QLabel(this);
    IdLabel = new QLabel(this);

    connect(this, &balance::CloseApp, this, &balance::closebtn_handler);
}

balance::~balance()
{
    delete ui;
}

void balance::info()
{

}


QString balance::getFname() const
{
    return Fname;
}

void balance::setFname(const QString &newFname)
{
    Fname = newFname;
}

QString balance::getLname() const
{
    return Lname;
}

void balance::setLname(const QString &newLname)
{
    Lname = newLname;
}


void balance::setType(const QString &accType)
{
    TypeLabel->setText(accType);
}


void balance::closebtn_handler()
{
    emit CloseApp();
}

void balance::setBalance(const QString &accBalance)
{
    BalanceLabel->setText(accBalance);
}


void balance::setIdaccount(const QString &accId)
{
    IdLabel->setText(accId);
}
