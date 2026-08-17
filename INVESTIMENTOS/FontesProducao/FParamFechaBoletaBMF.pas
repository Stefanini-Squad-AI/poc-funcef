unit FParamFechaBoletaBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmParamFechaBoletaBMF = class(TfrmCadastroCS)
    Label2: TLabel;
    Label1: TLabel;
    dblCorretora: TwwDBLookupCombo;
    QryCorretValores: TwwQuery;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    dbDtaOperacao: TCMDateTimePicker;
    qryIDLOTE: TStringField;
    qryIDCORRETVALORES: TFloatField;
    qrySGLCORRETVALORES: TStringField;
    qryDATAMOVCARTINV: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure MontaDatasQryCorretValores(dbDtaOperacao:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamFechaBoletaBMF: TfrmParamFechaBoletaBMF;

implementation

uses UMensErro,uDiasUteisInv;

{$R *.DFM}

procedure TfrmParamFechaBoletaBMF.MontaDatasQryCorretValores(dbDtaOperacao:string);
var
   dDataAnt : TDateTime;
begin
   With QryCorretValores Do
   Begin
    Close;
    ParamByName('dDataAtu').AsString := dbDtaOperacao;
    dDataAnt := StrToDate(dbDtaOperacao)-1;
    while not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) do
       dDataAnt  := dDataAnt-1;   // Achar o dia útil anterior
    ParamByName('dDataAnt').AsString := DateToStr(dDataAnt);
    Open;
   end;
end;

procedure TfrmParamFechaBoletaBMF.FormShow(Sender: TObject);
begin
  inherited;
   dbDtaOperacao.Text := DateToStr(date);
   MontaDatasQryCorretValores(dbDtaOperacao.Text);
   CMeCadastro.AtualizaBotoes(self);
end;

procedure TfrmParamFechaBoletaBMF.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled      := True;
   bbtnConfirmar.Enabled := True;
end;

procedure TfrmParamFechaBoletaBMF.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True);
end;

procedure TfrmParamFechaBoletaBMF.dbDtaOperacaoExit(Sender: TObject);
begin
  inherited;
   If Trim(dbDtaOperacao.Text) <> '' Then
      MontaDatasQryCorretValores(dbDtaOperacao.Text);
end;

procedure TfrmParamFechaBoletaBMF.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  CMeCadastro.AtualizaBotoes(self);
end;

procedure TfrmParamFechaBoletaBMF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
   Begin
      dbDtaOperacao.Text := MontaSelect.ValoresChave[1];
      If QryCorretValores.Locate('IDCORRETVALORES', MontaSelect.ValoresChave[0], [loPartialKey]) Then
         dblCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString
      Else
         dblCorretora.Text := '';
   End
   Else
   Begin
      dbDtaOperacao.Text := '';
      dblCorretora.Text  := '';
   End;
end;

end.
