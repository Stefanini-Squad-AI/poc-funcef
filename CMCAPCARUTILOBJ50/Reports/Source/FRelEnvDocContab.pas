unit FRelEnvDocContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Buttons, CmParamReport,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, Db,
  uCmSqlParams, DBClient, uCMClientDataSet, uCtrlParamIntegra, MontaSelect,
  Mask, DBTables, Wwquery, uCtrlRptEnvioDocumento;

type
  TfrmParamRelEnvDocContab = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    SbAdTodos: TSpeedButton;
    SbAdInverte: TSpeedButton;
    wwDBGrid1: TwwDBGrid;
    GpData: TGroupBox;
    Label3: TLabel;
    edtFavorecido: TEdit;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    cdsDocumentos: TCMClientDataSet;
    sqlDocumentos: TCMSqlParams;
    dsDocumentos: TDataSource;
    MontaSelect1: TMontaSelect;
    edtNumAP: TEdit;
    edtVlrLiquidoAP: TEdit;
    edtVlrBrutoAP: TEdit;
    qryAux: TwwQuery;
    Button1: TButton;
    grpStatus: TGroupBox;
    chkEnc: TCheckBox;
    chkNaoEnc: TCheckBox;
    edtDataEnvio: TEdit;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    MontaSelect2: TMontaSelect;
    GroupBox1: TGroupBox;
    DlIni: TCMDateTimePicker;
    Label2: TLabel;
    DlFim: TCMDateTimePicker;
    rdbDtVenc: TRadioButton;
    rdbDtEmis: TRadioButton;
    rdbDtLancto: TRadioButton;
    rdbDtdisponib: TRadioButton;
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlEnvioDocumento: TCtrlRptEnvioDocumento;
    function TrocaPontoOuVirgula(bTrocaPorPonto: Boolean; sValor: string): string;
  public
    { Public declarations }
  end;

var
  frmParamRelEnvDocContab: TfrmParamRelEnvDocContab;


implementation

uses uSistema, DBaseDados, UMensErro;

{$R *.DFM}

procedure TfrmParamRelEnvDocContab.SbAdTodosClick(Sender: TObject);
begin
  inherited;

  cdsDocumentos.First;
  while not cdsDocumentos.Eof do
  begin
    cdsDocumentos.Edit;
    cdsDocumentos.FieldByName('SELECIONADO').AsString := '1';
    cdsDocumentos.Post;
    cdsDocumentos.Next;
  end;
end;

procedure TfrmParamRelEnvDocContab.SbAdInverteClick(Sender: TObject);
begin
  inherited;

  cdsDocumentos.First;
  while not cdsDocumentos.Eof do
  begin
    cdsDocumentos.Edit;
    if cdsDocumentos.FieldByName('SELECIONADO').AsString = '1' then
      cdsDocumentos.FieldByName('SELECIONADO').AsString := '0'
    else
      cdsDocumentos.FieldByName('SELECIONADO').AsString := '1';

    cdsDocumentos.Post;
    cdsDocumentos.Next;
  end;
end;

procedure TfrmParamRelEnvDocContab.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlEnvioDocumento:= TCtrlRptEnvioDocumento.Create;
  CtrlEnvioDocumento.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  rdbDtVenc.Checked:= True;
  DlIni.date := now;
  DlFim.date := now;
end;

procedure TfrmParamRelEnvDocContab.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if cdsDocumentos.RecordCount <> 0 then
    begin
      if CtrlEnvioDocumento.GravaDesfazEnvioDocumento(cdsDocumentos.Data) then
        begin
          sqlDocumentos.Open;
          MsgDlg('Operação Efetuada com Sucesso!' ,'Aviso',mtInformation,[mbOk],0)
        end
      else
        MsgDlg(CtrlEnvioDocumento.MessageInfo ,'Erro',mtError,[mbOk],0);
    end
  else
    begin
      MsgDlg('É necessário fazer uma Pesquisa para desfazer o Envio.' ,'Erro',mtError,[mbOk],0);
    end;
end;

procedure TfrmParamRelEnvDocContab.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  MontaSelect1.Executar;

  If MontaSelect1.RetornouValor Then
    Begin
      edtFavorecido.Text:= MontaSelect1.ValoresChave[0];
    end;
end;

procedure TfrmParamRelEnvDocContab.bbtnConfirmarClick(Sender: TObject);
begin
  //inherited;

  if cdsDocumentos.RecordCount <> 0 then
    begin
      if CtrlEnvioDocumento.GravaFazEnvioDocumento(cdsDocumentos.Data) then
        begin
          Cmp_Padrao.ParamValues[0].AsString  :=  DlIni.Text;
          Cmp_Padrao.ParamValues[1].AsString  :=  DlFim.Text;
          Cmp_Padrao.ParamValues[2].AsString  :=  edtFavorecido.Text;
          Cmp_Padrao.ParamValues[3].AsString  :=  edtNumAP.Text;
          Cmp_Padrao.ParamValues[4].AsString  :=  edtVlrLiquidoAP.Text;
          Cmp_Padrao.ParamValues[5].AsString  :=  edtVlrBrutoAP.Text;
          Cmp_Padrao.ParamValues[6].AsBoolean :=  chkEnc.Checked;
          Cmp_Padrao.ParamValues[7].AsBoolean :=  chkNaoEnc.Checked;
          Cmp_Padrao.ParamValues[8].AsString  :=  edtDataEnvio.Text;
          if rdbDtVenc.Checked then
            Cmp_Padrao.ParamValues[9].AsString  := 'V';

          if rdbDtEmis.Checked then
            Cmp_Padrao.ParamValues[9].AsString  := 'E';

          if rdbDtLancto.Checked then
            Cmp_Padrao.ParamValues[9].AsString  := 'L';

          if rdbDtdisponib.Checked then
            Cmp_Padrao.ParamValues[9].AsString  := 'D';

        end
      else
        begin
          MsgDlg(CtrlEnvioDocumento.MessageInfo, 'Erro', mtError, [mbOk],0);
          ModalResult:= mrNone;
          Exit;
        end;
    end
  else
    begin
      MsgDlg('É necessário fazer uma Pesquisa para fazer o Envio.' ,'Erro',mtError,[mbOk],0);
      ModalResult:= mrNone;
      Exit;
    end;
end;

procedure TfrmParamRelEnvDocContab.Button1Click(Sender: TObject);
var
 sSql : string;

begin
  inherited;

  cdsDocumentos.Active := False;
  sqlDocumentos.sql.clear;

  sSql:= 'SELECT (0) AS SELECIONADO, '+
          ' D.DATAPROGRAMADA, '+
          ' D.DATAEMISSAO, '+
          ' (RTRIM(D.NODOCUMENTO) || '' '' || RTRIM(D.COMPLDOCUMENTO)) As Documento, '+
          ' D.CODDOCUMENTO, '+
          ' DECODE(D.IDENVIODOCUMENTO, NULL,''Não Encaminhado'', ''Encaminhado'') As Status, '+
          ' P.RAZAOSOCIAL, '+
          ' D.NODOCUMENTO, '+
          ' D.NUMAPGR, '+
          ' D.DATAVENCTO, '+
          ' PP.PLNPLANIL, '+
          ' D.IDENVIODOCUMENTO, '+
          ' L.VALOR AS VALORBRUTO, '+
          ' VW.SALDO AS VALORLIQUIDO '+
          ' FROM DOCUMENTO D, PESSOA P, LANCTODOCUM L, PLANILHA PP, VWSALDODOC VW, ENVIODOCUMENTO E  '+
          'WHERE (D.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +') ' +
          '  AND (D.RECPAG = '+ QuotedStr(ParamIntegra.recpag) +') '+
          '  AND (D.IDFORCLI = P.IDPESSOA) '+
          '  AND (D.CODDOCUMENTO = VW.CODDOCUMENTO) '+
          '  AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+
          '  AND (D.OPERACAO = L.OPERACAO) '+
          '  AND (L.PLNCODIGO = PP.PLNCODIGO) '+
          '  AND (D.IDENVIODOCUMENTO = E.IDENVIODOCUMENTO(+)) '+
          '  AND (D.NUMSLIP IS NULL) '+
          '  AND (D.STATUS <> ''2'' OR D.STATUS IS NULL) '+
          '  AND (D.OPERACAO IN (''2'', ''3'', ''14'')) '+
          '  and D.CODTIPDOC in '+
          '      (SELECT CODTIPDOC '+
          '         FROM TIPODOCRECPAG a '+
          '        WHERE a.RECPAG = '+ QuotedStr(ParamIntegra.recpag) + '' +
          '          and not exists (select 1  '+
          '                 from UsuarioxTpdocto b '+
          '                where recpag = '+ QuotedStr(ParamIntegra.recpag) + '' +
          '                  and b.idusuario = '+ IntToStr(Sistema.IdEmpresa) +') ' +
          '       union  '+
          '       SELECT CODTIPDOC '+
          '         FROM TIPODOCRECPAG a  '+
          '        WHERE a.RECPAG = '+ QuotedStr(ParamIntegra.recpag) + '' +
          '          and exists (select 1  '+
          '                 from UsuarioxTpdocto b '+
          '                where recpag = '+ QuotedStr(ParamIntegra.recpag) + '' +
          '                  and a.codtipdoc = b.codtipdoc ' +
          '                  and b.idusuario = ' + IntToStr(Sistema.IdEmpresa) +') ' +') ';

          if rdbDtVenc.Checked then
            begin
              if DlIni.text <> '' then
                sSql:= sSQL + ' and D.DATAVENCTO >= to_date(' + #39 + DlIni.text + #39 + ',''dd/mm/yyyy'') ';

              if DlFim.text <> '' then
                sSql:= sSQL + ' and D.DATAVENCTO <= to_date(' + #39 + DlFim.text + #39 + ',''dd/mm/yyyy'') ';
            end;

          if rdbDtEmis.Checked then
            begin
              if DlIni.text <> '' then
                sSql:= sSQL + ' and D.DATAEMISSAO >= to_date(' + #39 + DlIni.text + #39 + ',''dd/mm/yyyy'') ';

              if DlFim.text <> '' then
                sSql:= sSQL + ' and D.DATAEMISSAO <= to_date(' + #39 + DlFim.text + #39 + ',''dd/mm/yyyy'') ';
            end;

          if rdbDtLancto.Checked then
            begin
              if DlIni.text <> '' then
                sSql:= sSQL + ' and L.DATALANCTO >= to_date(' + #39 + DlIni.text + #39 + ',''dd/mm/yyyy'') ';

              if DlFim.text <> '' then
                sSql:= sSQL + ' and L.DATALANCTO <= to_date(' + #39 + DlFim.text + #39 + ',''dd/mm/yyyy'') ';
            end;

          if rdbDtdisponib.Checked then
            begin
              if DlIni.text <> '' then
                sSql:= sSQL + ' and D.DATADISPONIB >= to_date(' + #39 + DlIni.text + #39 + ',''dd/mm/yyyy'') ';

              if DlFim.text <> '' then
                sSql:= sSQL + ' and D.DATADISPONIB <= to_date(' + #39 + DlFim.text + #39 + ',''dd/mm/yyyy'') ';
            end;

          if edtFavorecido.Text <> '' then
            sSql:= sSQL +  ' AND P.RAZAOSOCIAL = ' + QuotedStr(edtFavorecido.Text);

          if edtNumAP.Text <> '' then
            sSql:= sSQL +  ' AND D.NUMAPGR = ' + edtNumAP.Text;

          if edtVlrLiquidoAP.Text <> '' then
            sSql:= sSQL +  ' AND VW.SALDO = ' + TrocaPontoOuVirgula(True, edtVlrLiquidoAP.Text);

          if edtVlrBrutoAP.Text <> '' then
            sSql:= sSQL +  ' AND L.VALOR = ' + TrocaPontoOuVirgula(True, edtVlrBrutoAP.Text);

          if (chkEnc.Checked = True) and (chkNaoEnc.Checked = False) then
            sSql:= sSQL +  ' AND D.IDENVIODOCUMENTO IS NOT NULL ';

          if (chkNaoEnc.Checked = True) and (chkEnc.Checked = False) then
            sSql:= sSQL +  ' AND D.IDENVIODOCUMENTO IS NULL ';

          if edtDataEnvio.Text <> '' then
            sSql:= sSQL +  ' AND E.TRGDTINCLUSAO = TO_DATE(' + QuotedStr(edtDataEnvio.Text) +', ''DD/MM/YYYY HH24:MI:SS'')';

          sSql:= sSQL + ' ORDER BY P.RAZAOSOCIAL, NODOCUMENTO ';

  sqlDocumentos.SQL.Add(sSql);
  sqlDocumentos.Open;

end;

function TfrmParamRelEnvDocContab.TrocaPontoOuVirgula(
  bTrocaPorPonto: Boolean; sValor: string): string;
var
i, iItemsString: integer;
sValorFinal: string;

begin
//   Esta função troca todos as vírgulas encontradas na string
//passada por ponto, para poderem ser usadas nas qry's.
   Result       := '';
   iItemsString := Length(sValor);

   for i := 1 to iItemsString do
   begin
     //  Se for trocar vírgula por ponto...
     if bTrocaPorPonto then
     begin
        if sValor[i] = ',' then
           sValorFinal := sValorFinal + '.'
        else
           sValorFinal := sValorFinal + sValor[i];
     end
     else
     //  Se for trocar ponto por vírgula...
     begin
        if sValor[i] = '.' then
           sValorFinal := sValorFinal + ','
        else
           sValorFinal := sValorFinal + sValor[i];
     end;
   end;

   Result := sValorFinal;

end;

procedure TfrmParamRelEnvDocContab.SpeedButton4Click(Sender: TObject);
begin
  inherited;

  MontaSelect2.Filtro.Add(' DOCUMENTO.RECPAG = ' + QuotedStr(ParamIntegra.recpag));
  MontaSelect2.Executar;

  If MontaSelect2.RetornouValor Then
    Begin
      edtDataEnvio.Text:= MontaSelect2.ValoresChave[3];
    end;
end;

procedure TfrmParamRelEnvDocContab.FormDestroy(Sender: TObject);
begin
  inherited;

  CtrlEnvioDocumento.Free;
end;

end.
