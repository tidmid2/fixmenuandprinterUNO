unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, Vcl.StdCtrls, FireDAC.Comp.Client, Data.DB;

type
  TForm3 = class(TForm)
    FDConnection1: TFDConnection;
    fdquery_bu: TFDCommand;
    fdquery_bi: TFDCommand;
    Button1: TButton;
    Button2: TButton;
    drop_key: TFDCommand;
    add_key: TFDCommand;
    Button3: TButton;
    del_print: TFDCommand;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
    fdquery_bi.Execute(1);
    fdquery_bu.Execute(1);
    showmessage('Успешно Исправлено')
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
    drop_key.Execute(1);
    add_key.Execute(1);
    showmessage('Успешно исправлено')
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
    if MessageDlg('Удаленные чеки не вернуть! Вы Уверены',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      del_print.Execute(1);
      showmessage('Успешно Очищено')
   end;

end;

end.
