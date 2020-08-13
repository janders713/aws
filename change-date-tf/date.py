import datetime


def date_conv(event, context):
    return datetime.date.today().__format__("%d/%m/%Y")
