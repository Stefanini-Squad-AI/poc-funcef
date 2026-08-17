unit FRelSlip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, Machklb,
  IvDictio, IvMulti, wwdbdatetimepicker, CMDateTimePicker, IvEMulti,
  fParamReports_Padrao, CmParamReport, DBClient, uCMClientDataSet,
  uCmSqlParams, uCtrlParamIntegra, uCtrlRelatoriosCAPCAR;

type
  TFrmRelSlip = class(TfrmParamReports_Padrao)
    RgTipo: TRadioGroup;
    wwDBGrid1: TwwDBGrid;
    DsPendentes: TwwDataSource;
    LblOperacao: TPanel;
    Panel1: TPanel;
    SbAdTodos: TSpeedButton;
    SbAdInverte: TSpeedButton;
    GpData: TGroupBox;
    Label2: TLabel;
    DlIni: TCMDateTimePicker;
    DlFim: TCMDateTimePicker;
    Label1: TLabel;
    SqlPendentes: TCMSqlParams;
    CdsPendentes: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsParaParam: TCMClientDataSet;
    CdsParaParamDoc: TStringField;
    procedure RgTipoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject;
      AFieldName: string);
    procedure FormCreate(Sender: TObject);
    procedure DlIniChange(Sender: TObject);
    procedure DlFimChange(Sender: TObject);
  private
    { Private declarations }
    CtrlRelatoriosCAPCAR: TCtrlRelatoriosCAPCAR;
  public
    { Public declarations  }
  end;

var
  FrmRelSlip: TFrmRelSlip;

implementation

uses uSistema, DbaseDados;
{$R *.DFM}

procedure TFrmRelSlip.RgTipoClick(Sender: TObject);
var
  ssql: string;
begin
  inherited;
  CdsPendentes.Active := False;
  SqlPendentes.sql.clear;
  case RgTipo.ItemIndex of
    0:
      begin
        LblOperacao.Caption := 'Pendências na Impressão de SLIP';
        SqlPendentes.sql.add('SELECT (0) AS SELECIONADO ,DATAPROGRAMADA, DATAEMISSAO, (RTRIM(NODOCUMENTO) || '' '' || RTRIM(COMPLDOCUMENTO)) As Documento, CODDOCUMENTO, PESSOA.RAZAOSOCIAL, NODOCUMENTO ');
        SqlPendentes.sql.add('FROM DOCUMENTO, PESSOA WHERE (DOCUMENTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +
          ') AND (RECPAG = ''P'') AND (DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA) AND ');
        SqlPendentes.sql.add('(NUMSLIP IS NULL) AND (STATUS <> ''2'' OR STATUS IS NULL) AND (DOCUMENTO.OPERACAO IN (''2'',''3'',''14'')) ');
        SqlPendentes.sql.add(' and documento.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
          ParamIntegra.RecPag + ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
          ' and b.idusuario=' +
          inttostr(sistema.IdUsuario) + ') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
          ParamIntegra.RecPag + '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
          ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
          inttostr(sistema.idusuario) + '))');

        if DlIni.text <> '' then
          SqlPendentes.sql.add(' and DATAEMISSAO >= to_date(' + #39 + DlIni.text + #39 + ',''dd/mm/yyyy'')');

        if DlFim.text <> '' then
          SqlPendentes.sql.add(' and DATAEMISSAO <= to_date(' + #39 + DlFim.text + #39 + ',''dd/mm/yyyy'')');

        SqlPendentes.sql.add('ORDER BY PESSOA.RAZAOSOCIAL, NODOCUMENTO ');
      end;
    1:
      begin
        ssql := '';
        if DlIni.text <> '' then
          ssql := ' and d.DATAEMISSAO >= to_date(' + #39 + DlIni.text + #39 + ',''dd/mm/yyyy'')';

        if DlFim.text <> '' then
          ssql := ssql + ' and d.DATAEMISSAO <= to_date(' + #39 + DlFim.text + #39 + ',''dd/mm/yyyy'')';

        LblOperacao.Caption := 'Documentos com SLIP já impressos';
        SqlPendentes.sql.add('SELECT (0) AS SELECIONADO ,DATAPROGRAMADA,DATAEMISSAO, (RTRIM(NODOCUMENTO) || '' '' || RTRIM(COMPLDOCUMENTO)) As Documento, CODDOCUMENTO, PESSOA.RAZAOSOCIAL, NODOCUMENTO ');
        SqlPendentes.sql.add('FROM DOCUMENTO, PESSOA ');
        SqlPendentes.sql.add(
          ',(select count(*) as totdocum , d.numslip from documento d where ' +
          '        D.RECPAG         = ''P''  AND ' +
          '       d.numslip is not null ' + ssql +
          ' group by d.numslip  ) totdocum ' +
          ',(select count(*) as totdocum , d.numslip from   documento d where ' +
          '        D.RECPAG         = ''P''  AND ' +
          '       d.numslip is not null   and ' +
          '       d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =  ''P''' +
          ' and not exists  (select 1 from UsuarioxTpdocto b where recpag=''P'' and b.idusuario=' + inttostr(sistema.idusuario) +
          '   ) union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''P''' +
          '  and exists (select 1 from UsuarioxTpdocto b where recpag=''P'' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
          inttostr(sistema.idusuario) +
          ')) ' + ssql + ' group by  d.numslip    ) totlote ');

        SqlPendentes.sql.add(' WHERE (DOCUMENTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +
          ') AND (RECPAG = ''P'') AND (DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA) AND ');
        SqlPendentes.sql.add('(DOCUMENTO.NUMSLIP IS NOT NULL) and ');
        SqlPendentes.sql.add('  totlote.totdocum=totdocum.totdocum and totdocum.numslip=totlote.numslip and totdocum.numslip=documento.numslip  ');
        if DlIni.text <> '' then
          SqlPendentes.sql.add(' and DATAEMISSAO >= to_date(' + #39 + DlIni.text + #39 + ',''dd/mm/yyyy'')');

        if DlFim.text <> '' then
          SqlPendentes.sql.add(' and DATAEMISSAO <= to_date(' + #39 + DlFim.text + #39 + ',''dd/mm/yyyy'')');

        SqlPendentes.sql.add('ORDER BY PESSOA.RAZAOSOCIAL, NODOCUMENTO ');
      end;
  end;
  SqlPendentes.Open;
end;

procedure TFrmRelSlip.bbtnConfirmarClick(Sender: TObject);
var
  sLista: string;
begin
  inherited;
  sLista := '';
  CdsPendentes.First;
  while not CdsPendentes.Eof do
  begin
    if CdsPendentes.FieldByName('SELECIONADO').AsString = '1' then
    begin
      sLista := sLista + CdsPendentes.FieldByName('CODDOCUMENTO').AsString + ',';
      CdsParaParam.Append;
      CdsParaParam.Fields[0].AsString := CdsPendentes.FieldByName('CODDOCUMENTO').AsString;
      CdsParaParam.Post;
    end;
    CdsPendentes.Next;
  end;
  if sLista <> '' then
    if RgTipo.ItemIndex = 0 then
    begin
      if not CtrlRelatoriosCAPCAR.SetNumSlipLoop(CdsParaParam.Data) then
        //
        ;
    end;

  sLista := Copy(sLista, 1, Length(sLista) - 1);
  Cmp_Padrao.ParamValues[0].AsString := sLista;
end;

procedure TFrmRelSlip.SbAdTodosClick(Sender: TObject);
begin
  inherited;
  CdsPendentes.First;
  while not CdsPendentes.Eof do
  begin
    CdsPendentes.Edit;
    CdsPendentes.FieldByName('SELECIONADO').AsString := '1';
    CdsPendentes.Post;
    CdsPendentes.Next;
  end;
end;

procedure TFrmRelSlip.SbAdInverteClick(Sender: TObject);
begin
  inherited;
  CdsPendentes.First;
  while not CdsPendentes.Eof do
  begin
    CdsPendentes.Edit;
    if CdsPendentes.FieldByName('SELECIONADO').AsString = '1' then
      CdsPendentes.FieldByName('SELECIONADO').AsString := '0'
    else
      CdsPendentes.FieldByName('SELECIONADO').AsString := '1';
    CdsPendentes.Post;
    CdsPendentes.Next;
  end;
end;

procedure TFrmRelSlip.wwDBGrid1TitleButtonClick(Sender: TObject;
  AFieldName: string);
begin
  inherited;
  if CdsPendentes.Active then
    if Application.MessageBox('Os registros selecionados serão desmarcados. Confirma Ordenação! ', 'Aguardando Comando...',
      Mb_IconInformation + Mb_OkCancel) = Id_Cancel then
      exit;
  if RgTipo.ItemIndex = 0 then
    SqlPendentes.sql.Delete(6)
  else
    SqlPendentes.sql.Delete(8);
  SqlPendentes.sql.add('order by ' + AFieldName);
  SqlPendentes.open;
end;

procedure TFrmRelSlip.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
  CtrlRelatoriosCAPCAR.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  DlIni.date := now;
  DlFim.date := now;
end;

procedure TFrmRelSlip.DlIniChange(Sender: TObject);
begin
  inherited;
  RgTipoClick(Sender);
end;

procedure TFrmRelSlip.DlFimChange(Sender: TObject);
begin
  inherited;
  RgTipoClick(Sender);
end;

end.

