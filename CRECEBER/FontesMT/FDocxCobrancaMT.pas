(*******************************************************************************
Atualizado em : 12/07/2002
Por : Fábio Barros da Silva
Descrição: Atualização deste módulo para o modelo 3 camadas

Últimas Atualizações: 17/10/2002 - Revisão do Módulo - Fábio Barros
                      28/08/2003 - André Tavares -  pendência 13159

*******************************************************************************)

unit FDocxCobrancaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FProcuraCliFor, MontaSelect, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Db, DBTables,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, ComCtrls, Wwdatsrc,
  CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  uCtrlDocxCobranca, uCmSqlParams, uCtrlTipoDocRecPag, uCtrlParamIntegra;

type
  TFrmDocxCobrancaMT = class(TFrmProcuraCliFor)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DataEmissIni: TCMDateTimePicker;
    DataEmissFim: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    DataProgIni: TCMDateTimePicker;
    DataProgFim: TCMDateTimePicker;
    GpTipoCobr: TGroupBox;
    CmbCobranca: TwwDBLookupCombo;
    PageCobr: TPageControl;
    TbsPend: TTabSheet;
    TbsAssoc: TTabSheet;
    Panel5: TPanel;
    dbgrdDocPendentes: TwwDBGrid;
    Panel4: TPanel;
    bbtnPgto: TBitBtn;
    bbtnPgtoParcial: TBitBtn;
    Pnldocpendentes: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    dbgrdAssoc: TwwDBGrid;
    Panel7: TPanel;
    bbtnDesfazPgto: TBitBtn;
    bbtnConfirma: TBitBtn;
    Pnldocpago: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    dsDocPendentes: TwwDataSource;
    DsDocAssoc: TwwDataSource;
    DsDocPendentesAssoc: TwwDataSource;
    DbgPendentesAssoc: TwwDBGrid;
    GroupBox3: TGroupBox;
    dblkTipClie: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    CkbMensagens: TCheckBox;
    CkbApaga: TCheckBox;
    Panel6: TPanel;
    Panel8: TPanel;
    DsMsg: TwwDataSource;
    LbCnab: TListBox;
    GroupBox5: TGroupBox;
    CmbTipoDoc: TwwDBLookupCombo;
    cdsAlteradores: TCMClientDataSet;
    cdsRateioDoc: TCMClientDataSet;
    cdsFormaPag: TCMClientDataSet;
    cdsDocPendentes: TCMClientDataSet;
    sqlDocPendentes: TCMSqlParams;
    cdsDocAssoc: TCMClientDataSet;
    sqlDocAssoc: TCMSqlParams;
    cdsDocPendentesAssoc: TCMClientDataSet;
    sqlDocPendentesAssoc: TCMSqlParams;
    cdsTipoClie: TCMClientDataSet;
    sqlTipoClie: TCMSqlParams;
    cdsTipoDoc: TCMClientDataSet;
    sqlMsg: TCMSqlParams;
    cdsMsg: TCMClientDataSet;
    ChkBoxHistoricoMsg: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnPgtoClick(Sender: TObject);

    procedure bbtnDesfazPgtoClick(Sender: TObject);
    procedure bbtnPgtoParcialClick(Sender: TObject);

    procedure bbtnConfirmaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);

    procedure bbtnCancelarClick(Sender: TObject);
    procedure CkbMensagensClick(Sender: TObject);
    procedure DsDocPendentesAssocDataChange(Sender: TObject;
      Field: TField);
  private
    _CtrlDocxCobranca  : TCtrlDocxCobranca;
    _CtrlTipoDocRecPag : TCtrlTipoDocRecPag;
    sSQLPadrao        : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDocxCobrancaMT: TFrmDocxCobrancaMT;

implementation

Uses uModulo, uDataBase, uSistema, uMensErro, DBaseDados, uFuncaoGeral;

{$R *.DFM}

procedure TFrmDocxCobrancaMT.SpeedButton1Click(Sender: TObject);
Var
  sSql, sSqlAux: String;
begin
  inherited;
  if CmbCobranca.Text <> '' then
  begin
    Try
      sSql := '';
      if CPForCli.ForCliReg.RazaoSocial <> '' then
        sSql := ' (D.IdForCli = ' + IntToStr(CPForCli.ForCliReg.Id) + ') AND ';

      if (DataEmissIni.Text <> '') and (DataEmissFim.Text <> '') then
        sSql := sSql + ' (D.DataEmissao >= TO_DATE(' + QuotedStr(DataEmissIni.Text) + ',''DD/MM/YYYY'') ' +
                       '  AND D.DataEmissao <= TO_DATE(' + QuotedStr(DataEmissFim.Text) + ',''DD/MM/YYYY'')) AND ';

      if (DataProgIni.Text <> '') and (DataProgFim.Text <> '') then
        sSql := sSql + ' (D.DataProgramada >= TO_DATE(' + QuotedStr(DataProgIni.Text) + ',''DD/MM/YYYY'') ' +
                       '  AND D.DataProgramada <= TO_DATE(' + QuotedStr(DataProgFim.Text) + ',''DD/MM/YYYY'')) AND ';

      if PageCobr.ActivePage = TbsPend then
      begin
        sSqlAux := 'SELECT ' +
                   '  P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO,D.DATAEMISSAO, ' +
                   '  D.DATAPROGRAMADA, D.CODDOCUMENTO, D.EMISBLOQ, D.CODPORTFORMA, D.IDFORCLI ' +
                   'FROM ' +
                   '  PESSOA P, CLIENTEPESS CP, DOCUMENTO D ' +
                   'WHERE ' +
                   '  D.CODTIPDOC in ' +
                   '   (SELECT CODTIPDOC FROM TIPODOCRECPAG A ' +
                   '    WHERE A.RECPAG = '+QuotedStr(ParamIntegra.RecPag) +
                   '          AND NOT EXISTS (SELECT 1 FROM UsuarioxTpdocto B ' +
                   '                          WHERE RECPAG = ' + QuotedStr(ParamIntegra.RecPag) +
                   '                                AND B.IDUSUARIO = ' + IntToStr(Sistema.IdUsuario)+') '+
                   '    UNION ' +
                   '    SELECT CODTIPDOC  FROM TIPODOCRECPAG A ' +
                   '    WHERE A.RECPAG = '+ QuotedStr(ParamIntegra.RecPag) +
                   '         AND EXISTS (SELECT 1 FROM UsuarioxTpdocto B ' +
                   '                     WHERE RECPAG = ' + QuotedStr(ParamIntegra.RecPag) +
                   '                           AND A.CODTIPDOC = B.CODTIPDOC ' +
                   '                           AND B.IDUSUARIO = ' + IntToStr(Sistema.Idusuario) + ')) AND ' +
                   ' (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND ' +
                   ' (RTRIM(D.STATUS) <> ''2'') AND ' +
                   ' (D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND ' +
                   ' (D.RECPAG = ' + QuotedStr(ParamIntegra.RecPag) + ') AND ' +
                   FuncaoGeral.Decode(dblkTipClie.Text,'','',
                   ' ((CP.IDTIPOCLIENTE = ' + dblkTipClie.LookupValue + ') OR ' +
                   ' (D.IDFORCLI IN (SELECT IDPESSOA FROM CLIXTIPOCLI WHERE IDTIPOCLIENTE = ' +  dblkTipClie.LookupValue + '))) AND ') +
                   FuncaoGeral.Decode(CmbTipoDoc.Text,'','',
                   ' (D.CODTIPDOC = ' + CmbTipoDoc.LookupValue + ') AND ') +
                   ' (D.EMISBLOQ IS NULL) AND ' +
                  sSql +
                  ' (CP.IDPESSOA = P.IDPESSOA) AND ' +
                  ' (D.IDFORCLI = P.IDPESSOA) ' +
                  ' ORDER BY P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO ';

        sqlDocPendentes.SQL.Text := sSqlAux;
        sqlDocPendentes.Prepare;
        sqlDocPendentes.Open;

        sSqlAux := 'SELECT ' +
                   '  P.RAZAOSOCIAL,D.NODOCUMENTO, D.COMPLDOCUMENTO,D.DATAEMISSAO, ' +
                   '  D.DATAPROGRAMADA,D.CODDOCUMENTO, D.EMISBLOQ, D.CODPORTFORMA, D.IDFORCLI ' +
                   'FROM ' +
                   '  PESSOA P, CLIENTEPESS CP, DOCUMENTO D ' +
                   'WHERE ' +
                   '  (D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND ' +
                   '  (D.RECPAG = ' + QuotedStr(ParamIntegra.RecPag) + ') AND ' +
                   '  (D.EMISBLOQ = ''N'') AND ' +
                   '  (D.STATUS <> ''2'') AND ' +
                   '  (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND  ' +
                   '  (D.CODPORTFORMA = ' + CmbCobranca.LookupValue + ') AND ' +
                   FuncaoGeral.Decode(dblkTipClie.Text,'','',
                   '  ((CP.IDTIPOCLIENTE = ' + dblkTipClie.LookupValue + ') OR ' +
                   '  (D.IDFORCLI IN (SELECT IDPESSOA FROM CLIXTIPOCLI WHERE IDTIPOCLIENTE = ' +  dblkTipClie.LookupValue + '))) AND ') +
                   FuncaoGeral.Decode(CmbTipoDoc.Text,'','',
                   '  (D.CODTIPDOC = ' + CmbTipoDoc.LookupValue + ') AND ') +
                   '  (CP.IDPESSOA = P.IDPESSOA) AND ' +
                   sSql +
                   '  (D.IDFORCLI = P.IDPESSOA) ORDER BY P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO ';

        sqlDocAssoc.SQL.Text := sSqlAux;
        sqlDocAssoc.Open;
      End
      Else
        sSqlAux := 'SELECT ' +
                   '  P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO,D.DATAEMISSAO, ' +
                   '  D.DATAPROGRAMADA,D.CODDOCUMENTO, D.EMISBLOQ, D.CODPORTFORMA, D.IDFORCLI ' +
                   'FROM ' +
                   '  PESSOA P, CLIENTEPESS CP, DOCUMENTO D   ' +
                   'WHERE ' +
                   '  D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE a.RECPAG = ' + QuotedStr(ParamIntegra.RecPag) +
                   '                  AND NOT EXISTS (SELECT 1 FROM UsuarioxTpdocto B ' +
                   '                                  WHERE RECPAG = ' + QuotedStr(ParamIntegra.RecPag) +
                   '                                        AND B.IDUSUARIO = '+ IntToStr(Sistema.IdUsuario)+') ' +
                   '                  UNION ' +
                   '                  SELECT CODTIPDOC FROM TIPODOCRECPAG A ' +
                   '                  WHERE A.RECPAG = '+ QuotedStr(ParamIntegra.RecPag) +
                   '                        AND EXISTS (SELECT 1 FROM UsuarioxTpdocto B ' +
                   '                                    WHERE RECPAG = '+ QuotedStr(ParamIntegra.RecPag) +
                   '                                          AND A.CODTIPDOC = B.CODTIPDOC ' +
                   '                                          AND B.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario)+'))'+
                   '  AND (D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND ' +
                   '  (D.RECPAG = ' + QuotedStr(ParamIntegra.RecPag) + ') AND ' +
                   '  (D.EMISBLOQ = ''N'') AND ' +
                   '  (D.STATUS <> ''2'') AND ' +
                   '  (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND ' +
                   '  (D.CODPORTFORMA = ' + CmbCobranca.LookupValue + ') AND ' +
                   FuncaoGeral.Decode(dblkTipClie.Text,'','',
                   '  ((CP.IDTIPOCLIENTE = ' + dblkTipClie.LookupValue + ') OR ' +
                   '  (D.IDFORCLI IN (SELECT IDPESSOA FROM CLIXTIPOCLI WHERE IDTIPOCLIENTE = ' +  dblkTipClie.LookupValue + '))) AND ') +
                   FuncaoGeral.Decode(CmbTipoDoc.Text,'','',
                   '  (D.CODTIPDOC = ' + CmbTipoDoc.LookupValue + ') AND ') +
                   '  (CP.IDPESSOA = P.IDPESSOA) AND ' +
                   sSql +
                   '  (D.IDFORCLI = P.IDPESSOA) ORDER BY P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO ';
      sqlDocPendentesAssoc.SQL.Text := sSqlAux;
      sqlDocPendentesAssoc.Open;
    finally
    end;
  end
  Else
    Msgdlg('Não Foi Informado a' + GpTipoCobr.Caption,'Atenção',MtInformation,[MbOk],0);
end;

procedure TFrmDocxCobrancaMT.bbtnPgtoClick(Sender: TObject);
begin
  inherited;
  FuncaoGeral.MoveRegistros(dbgrdDocPendentes,dbgrdAssoc);
end;

procedure TFrmDocxCobrancaMT.bbtnDesfazPgtoClick(Sender: TObject);
begin
  inherited;
  FuncaoGeral.MoveRegistros(dbgrdAssoc,dbgrdDocPendentes);
end;

procedure TFrmDocxCobrancaMT.bbtnPgtoParcialClick(Sender: TObject);
begin
  inherited;
  dbgrdDocPendentes.SelectAll;
  FuncaoGeral.MoveRegistros(dbgrdDocPendentes,dbgrdAssoc);
end;

procedure TFrmDocxCobrancaMT.bbtnConfirmaClick(Sender: TObject);
begin
  inherited;
  dbgrdAssoc.SelectAll;
  FuncaoGeral.MoveRegistros(dbgrdAssoc,dbgrdDocPendentes);
end;

procedure TFrmDocxCobrancaMT.FormCreate(Sender: TObject);
begin
  inherited;
  _CtrlDocxCobranca     := TCtrlDocxCobranca.Create;
  _CtrlDocxCobranca.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  _CtrlTipoDocRecPag    := TCtrlTipoDocRecPag.Create;
  _CtrlTipoDocRecPag.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  cdsRateioDoc.Data     := _CtrlDocxCobranca.ListRateioDoc(0);
  cdsAlteradores.Data   := _CtrlDocxCobranca.ListAlteradores(0);
  cdsFormaPag.Data      := _CtrlDocxCobranca.ListFormaPag(Sistema.idEmpresa, ParamIntegra.RecPag);
  cdsTipoDoc.Data       := _CtrlTipoDocRecPag.ListTipoDocUsuario(ParamIntegra.RecPag, Sistema.IdUsuario);

  sqlDocPendentes.Open;
  sqlDocAssoc.Open;
  sqlDocPendentesAssoc.Open;
  sqlTipoClie.Open;
  sSQLPadrao            := 'SELECT ' +
                           '  P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO,D.DATAEMISSAO,D.DATAPROGRAMADA,D.CODDOCUMENTO, D.EMISBLOQ, D.CODPORTFORMA, D.IDFORCLI ' +
                           'FROM ' +
                           ' PESSOA P, DOCUMENTO D ' +
                           'WHERE 1=2 ';
end;

procedure TFrmDocxCobrancaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsRateioDoc.Close;
  cdsAlteradores.Close;
  cdsFormaPag.Close;
  cdsTipoDoc.Close;
  cdsDocPendentes.Close;
  cdsDocAssoc.Close;
  cdsDocPendentesAssoc.Close;
  cdsTipoClie.Close;
  _CtrlDocxCobranca.Free;
  _CtrlTipoDocRecPag.Free;
  inherited;
end;

procedure TFrmDocxCobrancaMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (PageCobr.ActivePage = TbsPend) and
      not ((cdsDocPendentes.IsEmpty) and (cdsDocAssoc.IsEmpty)) then
  begin
    if _CtrlDocxCobranca.GravarDocxCobranca(cdsDocPendentes.Data, cdsDocAssoc.Data, CmbCobranca.LookupValue,
                                            CkbApaga.Checked, CkbMensagens.Checked,
    //início - André Tavares - 28/08/2003 - pendência 13159
                                            ChkBoxHistoricoMsg.Checked) then
    //Fim - André Tavares - 28/08/2003 - pendência 13159
      Msgdlg('Cobranças Asssociadas com Sucesso!','Informação',MtInformation,[MbOk],0)
    else
    begin
      MsgDlg(_CtrlDocxCobranca.MessageInfo, 'Erro',mtError,[mbOk],0);
      Exit;
    end;
    bbtnCancelarClick(self);
  End
end;

procedure TFrmDocxCobrancaMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sqlDocPendentes.SQL.Text      := sSQLPadrao;
  sqlDocPendentes.Open;
  sqlDocAssoc.SQL.Text          := sSQLPadrao;
  sqlDocAssoc.Open;
  sqlDocPendentesAssoc.SQL.Text := sSQLPadrao;
  sqlDocPendentesAssoc.Open;
end;

procedure TFrmDocxCobrancaMT.CkbMensagensClick(Sender: TObject);
begin
  inherited;
  CkbApaga.Checked := CkbMensagens.Checked;
end;


procedure TFrmDocxCobrancaMT.DsDocPendentesAssocDataChange(Sender: TObject;
  Field: TField);
Var
  X:Integer;
begin
  inherited;
  lbCnab.Items.Clear;
  if cdsDocPendentesAssoc.State <> DsInactive then
  begin
    sqlMsg.Prepare;
    sqlMsg.ParamByName('CODDOCUMENTO').AsFloat := cdsDocPendentesAssoc.FieldByName('CODDOCUMENTO').AsFloat;
    sqlMsg.Open;
    if not cdsMsg.IsEmpty then
    begin
      cdsMsg.First;
      while Not cdsMsg.EOF do
      begin
        for X := 0 To 8 do LbCnab.Items.Append(cdsMsg.Fields[x].AsString);
        cdsMsg.Next;
      end;
    end;
  end;
end;

end.
