{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
{-----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Histórico de alterações -------------------------------------------------------------
Rotina......: 
Nº SIG......: 62683
Data........: 02/03/2018         
Responsável.: Darivaldo Alencar
Descrição...: Adicionado exportação personalizada para o relatorio de Destacamentos
-----------------------------------------------------------------------------------------------------------------------------------}
unit FSendMail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppFilDev, ppViewr, MAHlpBtn,
  DBClient,db,IniFiles,uCtrlSendMail;//Darivaldo Alencar SIG62683


type
  TFrmSendMail = class(TForm)
    pnlFundo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edSendTo: TEdit;
    memMsg: TMemo;
    RgTipo: TRadioGroup;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    ToolbarSep971: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    btnSend: TBitBtn;
    procedure btnSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    CtrlSendMail: TCtrlSendMail; //Darivaldo Alencar SIG62683
    Procedure SendMail;
    Function  GravaArq( s : String ) : String;
  public
    { Public declarations }
    cdsExport : TClientDataSet; //Darivaldo Alencar SIG62683
    sNomeRelat : String;
    ArquivoRpt: TppArchiveDevice;
    appViewer: TppViewer;
  end;

var
  FrmSendMail: TFrmSendMail;

implementation

{$R *.DFM}

Uses JclMapi, uSistema, uMensErro;

{ TFrmSendMail }

function TFrmSendMail.GravaArq(s: String): String;
Var
  i: Integer;
  sAux : String;
begin

  sAux := '';
  For i := 1 to Length(s) Do
  Begin
    If (s[i] <> '/') And (s[i] <> '\') And (s[i] <> ':') And
       (s[i] <> '*') And (s[i] <> '?') And (s[i] <> '"') And
       (s[i] <> '<') And (s[i] <> '>') And (s[i] <> '|') Then
      sAux := sAux + s[i];
  End;

  s := sAux;
  

  Case RgTipo.ItemIndex Of
    0: Begin
          s:= Sistema.TempDir + s + '.pdf';
          appViewer.Report.TextFileName        := s;
          appViewer.Report.AllowPrintToFile    := True;
          appViewer.Report.ShowCancelDialog    := False;
          appViewer.Report.ShowPrintDialog     := False;
          appViewer.Report.DeviceType          :='PDFFile';

          appViewer.Report.Print;
       End;
    1: Begin
          s:= Sistema.TempDir + s + '.Txt';
          appViewer.Report.TextFileName        := s;
          appViewer.Report.AllowPrintToFile    := True;
          appViewer.Report.ShowCancelDialog    := False;
          appViewer.Report.ShowPrintDialog     := False;
          appViewer.Report.DeviceType          :='ReportTextFile';
          appViewer.Report.Print;
       End;
    2: Begin
          //Darivaldo Alencar SIG62683 -inicio
          if (Trim(upperCase(s)) = 'DESTACAMENTOS') then
             begin
               CtrlSendMail.cdsExport:= cdsExport;
               CtrlSendMail.sNmRelatorio := Trim(upperCase(s));
               s:= Sistema.TempDir + s + '.csv';
               CtrlSendMail.GravacaoPersonalizada(s);
             end
          else begin
          //Darivaldo Alencar SIG62683 -fim
            s:= Sistema.TempDir + s + '.xls';
            appViewer.Report.TextFileName        := s;
            appViewer.Report.AllowPrintToFile    := True;
            appViewer.Report.ShowCancelDialog    := False;
            appViewer.Report.ShowPrintDialog     := False;
            appViewer.Report.DeviceType          :='ExcelFile';
            appViewer.Report.Print;
          end;
       End;
    3: Begin
          s:= Sistema.TempDir + s + '.rcm';
          ArquivoRpt.FileName  := s;
          ArquivoRpt.Publisher := appViewer.Report.Publisher ;
          appViewer.Report.ResetDevices;
          appViewer.Report.PrintToDevices;
       End;
  End;
  Result := s;
end;

procedure TFrmSendMail.SendMail;
begin
    If not JclSimpleSendMail(edSendTo.Text, '', sNomeRelat,
                             memMsg.Text, GravaArq(sNomeRelat) )
    Then
       MsgDlg('Erro ao tentar enviar e-mail','Erro',mtError,[mbOk],0);
end;

procedure TFrmSendMail.btnSendClick(Sender: TObject);
begin
  inherited;
  If (edSendTo.Text) = '' Then
     Begin
        MsgDlg('Preencha o e-mail','Erro',mtError,[mbOk],0);
        edSendTo.SetFocus ;
     End
  Else
     Begin
        SendMail;
        ModalResult := MrOk;
     End;
end;

procedure TFrmSendMail.FormCreate(Sender: TObject);
begin
   Icon.Assign(Application.MainForm.Icon);
   CtrlSendMail:= TCtrlSendMail.create; //Darivaldo Alencar SIG62683
end;

procedure TFrmSendMail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndnil(CtrlSendMail);//Darivaldo Alencar SIG62683
  Action := caFree;
end;

procedure TFrmSendMail.bbtnSairClick(Sender: TObject);
begin
   ModalResult := MrOk;
end;

end.
