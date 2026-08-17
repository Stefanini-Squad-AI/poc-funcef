unit FCadCartaFianca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, TREdit, Wwdotdot,
  Wwdbcomb, wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, wwdblook;

type
  TfrmCadCartaFianca = class(TfrmCadastroCSInv)
    dbeNrFianca: TwwDBEdit;
    lblNrFianca: TLabel;
    lblDtEmissao: TLabel;
    dtEmissao: TCMDateTimePicker;
    lblDtVencto: TLabel;
    dtVencimento: TCMDateTimePicker;
    lblInstFiadora: TLabel;
    lblInstProtoc: TLabel;
    dbreValor: TDBRealEdit;
    lblValor: TLabel;
    qryIDCARTAFIANCA: TFloatField;
    qryIDINSTFIADORA: TFloatField;
    qryIDINSTPROTBMF: TFloatField;
    qryDATAEMISSAO: TDateTimeField;
    qryDATAVENCTO: TDateTimeField;
    qryVLRCARTAFIANCA: TFloatField;
    qryNRCARTAFIANCA: TFloatField;
    qryContraParte: TwwQuery;
    qryContraParteNOME: TStringField;
    qryContraParteIDPESSOA: TFloatField;
    dblkInstFiadora: TwwDBLookupCombo;
    dblkInstProt: TwwDBLookupCombo;
    qryDESCCARTAFIANCA: TStringField;
    dbeDescricao: TwwDBEdit;
    lblDescricao: TLabel;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Sel(N : Longint);    
  public
    { Public declarations }
  end;

var
  frmCadCartaFianca: TfrmCadCartaFianca;

implementation

uses UMensErro, UDataBase;

{$R *.DFM}

procedure TfrmCadCartaFianca.Sel(N : Longint);
begin
  qry.Close;
  qry.ParamByName('IDCARTAFIANCA').AsInteger := N;
  qry.Open;
end;

procedure TfrmCadCartaFianca.CmeCadastroBeforeConfirma(sender: TObject;
var Accept: Boolean);
begin
  inherited;
   Accept := False;
   if Trim(dbeNrFianca.Text) = '' then
   begin
     MsgDlg('Falta o número da Fiança.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbeNrFianca.CanFocus then
        dbeNrFianca.SetFocus;
     Exit;
   end
   else if Trim(dbeDescricao.Text) = '' then
   begin
     MsgDlg('Falta a Descrição da Fiança.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbeDescricao.CanFocus then
        dbeDescricao.SetFocus;
     Exit;
   end
   else if Trim(dblkInstFiadora.Text) = '' then
   begin
     MsgDlg('Falta a Instituição Fiadora.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dblkInstFiadora.CanFocus then
        dblkInstFiadora.SetFocus;
     Exit;
   end
   else if Trim(dtEmissao.Text) = '' then
   begin
     MsgDlg('Falta a data de Emissão.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dtEmissao.CanFocus then
        dtEmissao.SetFocus;
     Exit;
   end
   else if Trim(dtVencimento.Text) = '' then
   begin
     MsgDlg('Falta a data de Vencimento.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dtVencimento.CanFocus then
        dtVencimento.SetFocus;
     Exit;
   end
   else if dbreValor.Value = 0 then
   begin
      MsgDlg('Falta o valor da Operação.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreValor.CanFocus then
         dbreValor.SetFocus;
      Exit;
   end
   else if Trim(dblkInstProt.Text) = '' then
   begin
     MsgDlg('Falta a Instituição Protocolante na BM&F.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dblkInstProt.CanFocus then
        dblkInstProt.SetFocus;
     Exit;
   end
   else
   begin
      Accept := True;
      if qry.State = dsInsert then
         qryIDCARTAFIANCA.AsInteger := LeUltRegistro(nil, 'CARTAFIANCA');
   end;
end;

procedure TfrmCadCartaFianca.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCartaFianca.FormCreate(Sender: TObject);
begin
  inherited;
   Sel(-1);
end;

procedure TfrmCadCartaFianca.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if dbeNrFianca.CanFocus then
      dbeNrFianca.SetFocus;
end;

procedure TfrmCadCartaFianca.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if dbeNrFianca.CanFocus then
      dbeNrFianca.SetFocus;
end;

procedure TfrmCadCartaFianca.FormShow(Sender: TObject);
begin
  inherited;
   qryContraParte.Open;
end;

procedure TfrmCadCartaFianca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryContraParte.Close;
end;

end.
