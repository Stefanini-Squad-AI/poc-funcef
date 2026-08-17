unit FParamContratoBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, Mask, ComCtrls, Grids, Wwdbigrd,
  Wwdbgrid, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList,
  UmensErro, UDataBase;


type
  TfrmParamContratoBMF = class(TfrmCadastroCS)
    Label12: TLabel;
    qryTipoContratoInvest: TwwQuery;
    qryTipoContratoInvestIDTIPOCONTRINVEST: TFloatField;
    qryTipoContratoInvestDESCTIPOCTINVEST: TStringField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    dblTipoContratoInvest: TwwDBLookupCombo;
    dbdVigencia: TCMDateTimePicker;
    Label14: TLabel;
    qryIDPARAMCONTBMF: TFloatField;
    qryIDTIPOCONTRINVEST: TFloatField;
    qryDATAVIGENCIA: TDateTimeField;
    qryPESOCONTRATO: TFloatField;
    qryVALORCONTRATO: TFloatField;
    qryTOBN: TFloatField;
    qryTOBD: TFloatField;
    qryTXREGISTRO: TFloatField;
    qryTXBOLSA: TFloatField;
    qryTOBMINN: TFloatField;
    qryTOBMIND: TFloatField;
    dbeTOBNormal: TDBRealEdit;
    dbeTobDayTrade: TDBRealEdit;
    dbeTaxaRegistro: TDBRealEdit;
    dbeTaxaBolsa: TDBRealEdit;
    dbeTobMinNOrmal: TDBRealEdit;
    dbeTobMinDaytrade: TDBRealEdit;
    dbeValorContrato: TDBRealEdit;
    dbePesoContrato: TDBRealEdit;
    qryTipoTitulo: TwwQuery;
    qryTipoTituloCODTIPTITULO: TStringField;
    qryTipoTituloIDTIPOINVEST: TFloatField;
    qryInsTipoTitulo: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(N : Longint);
  public
    { Public declarations }
  end;

var
  frmParamContratoBMF: TfrmParamContratoBMF;

implementation

{$R *.DFM}

Uses DBaseDados;

procedure TfrmParamContratoBMF.Sel(N : Longint);
begin
  qry.Close;
  qry.ParamByName('P_IDPARAMCONTBMF').AsInteger := N;
  qry.Open;
end;

procedure TfrmParamContratoBMF.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  Accept := False;
  if dblTipoContratoInvest.LookupValue = '' Then
  begin
     MsgDlg('Tipo de Contrato de BM & F não preenchido', 'Erro', mtError, [mbOk], 0);
     dblTipoContratoInvest.SetFocus;
  end
  else
     if Trim(dbdVigencia.Text) = '' then
     begin
        MsgDlg('Data de Vigência não preenchida', 'Erro', mtError, [mbOk], 0);
        dbdVigencia.SetFocus;
     end
     else
        if Trim(dbeValorContrato.Text) = '' then
        begin
           MsgDlg('Valor do Contrato não preenchido', 'Erro', mtError, [mbOk], 0);
           dbeValorContrato.SetFocus;
        end
        else
           if Trim(dbePesoContrato.Text) = '' then
           begin
              MsgDlg('Peso do Contrato não preenchido', 'Erro', mtError, [mbOk], 0);
              dbePesoContrato.SetFocus;
           end
           else
           begin
              if Trim(dbdVigencia.Text) <> '' then
                 dbdVigencia.Text := FormatDateTime('DD/MM/YYYY', dbdVigencia.Date);
              Accept := True;
           end;
end;

procedure TfrmParamContratoBMF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Sel(StrToInt(MontaSelect.ValoresChave[0]))
  else
     Sel(-1);
end;

procedure TfrmParamContratoBMF.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

procedure TfrmParamContratoBMF.dsStateChange(Sender: TObject);
begin
  inherited;
  dblTipoContratoInvest.Enabled := qry.State <> dsEdit;
  dbdVigencia.Enabled           := qry.State <> dsEdit;
end;

procedure TfrmParamContratoBMF.bbtnConfirmarClick(Sender: TObject);
var
   sTipoTitulo : string;
begin
  if qry.State = dsInsert then
     qryIDPARAMCONTBMF.AsInteger := LeUltRegistro(nil,'PARAMCONTRATOBMF');
  dtmBaseDados.DbBaseDados.ApplyUpdates([qry]);

  inherited;

  with qryTipoTitulo do
  begin
     Close;
     sTipoTitulo := Copy(qryTipoContratoInvest.FieldByName('DESCTIPOCTINVEST').AsString,1,5);
     ParamByName('sTipoTitulo').AsString := sTipoTitulo;
     Open;
     if IsEmpty then // não existe o TipoTitulo
     begin
        with qryInsTipoTitulo do
        begin
           try
              if not dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.StartTransaction;
              ParamByName('CODTIPTITULO').AsString  := sTipoTitulo;
              ParamByName('IDTIPOINVEST').AsInteger := 8;
              ExecSql;
              DtmBaseDados.dbBaseDados.Commit;
           except on E: Exception do
              begin
                 DtmBaseDados.dbBaseDados.Rollback;
                 MsgDlg('Ocorreu problema ao incluir o tipo de título do contrato !'+
                        #13+E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
              end;
           end;
        end
     end;
  end;
end;

end.
