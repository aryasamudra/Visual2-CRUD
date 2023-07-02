unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids, frxClass,
  frxDBSet, Menus;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button6: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    MainMenu1: TMainMenu;
    MENU1: TMenuItem;
    FORMKUSTOMER1: TMenuItem;
    FORMSISWA1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FORMKUSTOMER1Click(Sender: TObject);
    procedure FORMSISWA1Click(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  id : string;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.posisiawal;
begin
bersih;
button1.Enabled:= True;
button2.Enabled:= False;
button3.Enabled:= False;
button4.Enabled:= False;
button5.Enabled:= False;
edit1.Enabled:= False;
edit2.Enabled:= False;
edit3.Enabled:= False;
edit4.Enabled:= False;
edit5.Enabled:= False;
end;

procedure TForm1.bersih;
begin
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
bersih;
button1.Enabled:= false;
button2.Enabled:= True;
button3.Enabled:= False;
button4.Enabled:= False;
button5.Enabled:= True;
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
edit5.Enabled:= True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if edit1.Text ='' then
begin
ShowMessage('NAMA KUSTOMER TIDAK BOLEH KOSONG!');
end else
if edit2.Text ='' then
begin
ShowMessage('No TELEPON TIDAK BOLEH KOSONG!');
end else
if edit3.Text ='' then
begin
ShowMessage('alamat TIDAK BOLEH KOSONG!');
end else
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('insert into kustomer values(null,"'+edit1.Text+'","'+edit2.Text+'","'+edit3.Text+'","'+edit4.Text+'","'+edit5.Text+'")');
ZQuery1.ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kustomer');
ZQuery1.Open;
showmessage('DATA BERHASIL DISIMPAN!');
posisiawal;
end;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
id:= ZQuery1.FieldByName('idkustomer').AsString;
edit1.Text:= ZQuery1.Fields[1].AsString;
edit2.Text:= ZQuery1.Fields [2].AsString;
edit3.Text:= ZQuery1.Fields[3].AsString; edit4.Text:= ZQuery1.Fields [4].AsString;
edit5.Text:= ZQuery1.Fields[5].AsString;
edit1.Enabled:= True;
edit2.Enabled:= True;
edit3.Enabled:= True;
edit4.Enabled:= True;
edit5.Enabled:= True;
button1.Enabled:= false;
button2.Enabled:= False;
button3.Enabled:= True;
button4.Enabled:= True;
button5.Enabled:= True;
edit1.Text:= ZQuery1.FieldList[1].AsString;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (edit1.Text = '') or (edit2.Text = '') or (edit3.Text = '') or (edit4.Text = '') or (edit5.Text = '') then
  begin
    ShowMessage('INPUTAN WAJIB DIISI!');
  end
  else if (edit1.Text = ZQuery1.Fields[1].AsString) and (edit2.Text = ZQuery1.Fields[2].AsString) and
          (edit3.Text = ZQuery1.Fields[3].AsString) and (edit4.Text = ZQuery1.Fields[4].AsString) and
          (edit5.Text = ZQuery1.Fields[5].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end
  else
  begin
    ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('Update kustomer set nmkustomer="' + edit1.text + '", telp="' + edit2.text + '", alamat="' + edit3.text + '", kota="' + edit4.text + '", kodepos="' + edit5.text + '" where idkustomer="' + id + '"');
    ZQuery1.ExecSQL;
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('select * from kustomer');
    ZQuery1.Open;
    posisiawal;
  end;
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from kustomer where idkustomer= 3');
ZQuery1. ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kustomer');
ZQuery1.Open;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
edit1.clear;
edit2.clear;
edit3.clear;
edit4.clear;
edit5.clear;
end;

procedure TForm1.FORMKUSTOMER1Click(Sender: TObject);
begin
form1.showmodal;
end;

procedure TForm1.FORMSISWA1Click(Sender: TObject);
begin
form2.showmodal;
end;

end.



