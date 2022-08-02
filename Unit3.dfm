object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 222
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 72
    Width = 153
    Height = 57
    Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1056#1077#1076#1072#1082#1090#1086#1088' '#1084#1077#1085#1102
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 72
    Width = 153
    Height = 57
    Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1059#1076#1072#1083#1077#1085#1080#1077' '#1084#1077#1085#1102
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 112
    Top = 152
    Width = 185
    Height = 57
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1090#1086#1088#1080#1102' '#1095#1077#1082#1072' '#1074' '#1073#1072#1079#1077
    TabOrder = 2
    OnClick = Button3Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\UNO\Database\RDB.AKS'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Port=3050'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 8
  end
  object fdquery_bu: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'CREATE OR ALTER trigger tbmenu_bu2 for tbmenu'
      'active before update position 2'
      'AS'
      'begin'
      '  if (new.back_color<>old.back_color) then'
      '   begin'
      '        new.back_color=3408135;'
      '   end'
      'end')
    Left = 144
    Top = 8
  end
  object fdquery_bi: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'CREATE OR ALTER trigger tbmenu_bi for tbmenu'
      'active before insert position 0'
      'as'
      'begin'
      '  if (new.id is null) then'
      '    new.id = gen_id(gen_tbmenu_id,1);'
      '    new.back_color=3408135;'
      
        '  select mcena from d_product where id = new.idproduct into new.' +
        'mcena;'
      
        '  select obsluzh, bobsluzh, bdiscount from tbMenu where id = new' +
        '.pid into new.obsluzh, new.bobsluzh, new.bdiscount;'
      'end')
    Left = 40
    Top = 8
  end
  object drop_key: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'ALTER TABLE TBPRINTED_ORDER '
      'DROP CONSTRAINT FK_TBPRINTED_ORDER_1')
    Left = 208
    Top = 16
  end
  object add_key: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'ALTER TABLE TBPRINTED_ORDER'
      'ADD CONSTRAINT FK_TBPRINTED_ORDER_1'
      'FOREIGN KEY (IDPRODUCT)'
      'REFERENCES TBMENU(ID)'
      'ON DELETE CASCADE'
      'USING INDEX FK_TBPRINTED_ORDER_1')
    Left = 248
    Top = 16
  end
  object del_print: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'delete from tbprinted_order')
    Left = 296
    Top = 16
  end
end
