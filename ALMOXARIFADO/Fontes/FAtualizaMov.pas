unit FAtualizaMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery, wwdblook, CMDBLookupCombo,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmAtualizaMov = class(TfrmSairAjuda)
    Panel1: TPanel;
    Memo1: TMemo;
    qryArt: TwwQuery;
    qryMov: TwwQuery;
    qryArtCODARTIGO: TStringField;
    qryArtDESCPROD: TStringField;
    qryMovIDMOV: TFloatField;
    qryMovCODTIPOMOV: TStringField;
    qryMovIDEMPRESA: TFloatField;
    qryMovCODARTIGO: TStringField;
    qryMovCODCENTROCUSTO: TStringField;
    qryMovCODALMOXARIFADO: TFloatField;
    qryMovDATAMOV: TDateTimeField;
    qryMovQTDEMOV: TFloatField;
    qryMovVALORMOV: TFloatField;
    qryMovDATALANCMOV: TDateTimeField;
    qryMovCUSTOMEDIOMOV: TFloatField;
    qryMovSALDOQTDEMOV: TFloatField;
    qryMovIDPESSOA: TFloatField;
    qryMovNUMDOCUMENTO: TStringField;
    qryMovCODALMOXTRANSF: TFloatField;
    qryMovPLNCODIGO: TFloatField;
    qryMovIDMOVENTRADA: TFloatField;
    BtnAtualiza: TBitBtn;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    dblcArt: TCMDBLookupCombo;
    LbArtigo: TLabel;
    updMov: TUpdateSQL;
    qryAux: TwwQuery;
    qryUnCusteio: TwwQuery;
    plnAni: TPanel;
    Ani: TAnimate;
    Label1: TLabel;
    qryAlmox: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure BtnAtualizaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edDataIExit(Sender: TObject);
  private
    { Private declarations }
     Procedure ProcessaArt;
  public
    { Public declarations }
  end;

var
  FrmAtualizaMov: TFrmAtualizaMov;

implementation

{$R *.DFM}
Uses uSistema, uModulo, uMensErro,DBaseDados, UDataBase,uMovNew,
     uAutorizacao;

procedure TFrmAtualizaMov.FormCreate(Sender: TObject);
begin
  inherited;
  qryArt.Close;
  qryArt.Open;
  //
  qryAlmox.Close;
  qryAlmox.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAlmox.Open;
  //
  edDataI.Date := Date;
end;

Procedure TFrmAtualizaMov.ProcessaArt;
Begin
   plnAni.Visible := True;
   Ani.Active     := True;
   Application.ProcessMessages;
   //
   qryAlmox.First;
   While not qryAlmox.EOF do
      Begin
         MovNew.AtualizaSaldo((edDataI.Date+1),dblcArt.LookupValue,qryAlmox.FieldByName('CODALMOXARIFADO').asInteger );
         qryAlmox.Next;
      End;
   //
   MovNew.GeraRetroativo((edDataI.Date+1),dblcArt.LookupValue);
   Ani.Active     := False;
   plnAni.Visible := False;
end;

procedure TFrmAtualizaMov.BtnAtualizaClick(Sender: TObject);
begin
  inherited;
    If Trim(dblcArt.Text) = '' Then
       Begin
         MsgDlg('Artigo não selecionado','Erro',mtError,[MbOk],0);
         dblcArt.SetFocus;
       End
    Else
    If Trim(edDataI.Text) = '' Then
       Begin
         MsgDlg('Data não preenchida','Erro',mtError,[MbOk],0);
         edDataI.SetFocus;
       End
    Else
       Begin
            BtnAtualiza.Enabled := False;
          Try
             StartTransacao;
             ProcessaArt;
             CommitTransacao;
             MsgDlg('Atualização realizada com sucesso','Informação',mtInformation,[MbOk],0);
          Except
             RollBackTransacao;
             MsgDlg('Atualização não realizada','Erro',mtError,[MbOk],0);
          End;
           BtnAtualiza.Enabled := True;
       End;
end;

procedure TFrmAtualizaMov.FormActivate(Sender: TObject);
Var
   x      : Byte;
   sSenha : String;
begin
  inherited;
  x:= 0;
  Repeat
       Inc( x );
       If InputQuery('ALMOXARIFADO E CUSTOS','Senha de Acesso',sSenha) Then
          Begin
             If uAutorizacao.VerificarSuperSenha( sSenha ) Then
                x := 10
             Else
                MsgDlg('Senha incorreta','Erro',mtError,[mbOK],0);
          End
       Else
          Begin
             x := 10;
             Close;
          End;
  Until x >= 3;
 If x <= 3 Then Close;

End;

procedure TFrmAtualizaMov.edDataIExit(Sender: TObject);
begin
  inherited;
  If edDataI.Date < Modulo.LeDataImplantacao + 1  Then
     Begin
       MsgDlg('Data não pode ser menor que a data de implatação','Erro',mtError,[MbOk],0);
       edDataI.SetFocus;
     End
end;

end.
