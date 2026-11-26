{*********************************************************************************
  Histórico de Alterações:
---------------------------------------------------------------------------------
Rotinas   : bbtnConfirmarClick, pReport(.dfm)
Data      : 28/09/2016
Autor     : Peterson Victor
SIG       : 29865
Descrição : Alteração da query para geração do relatorio
---------------------------------------------------------------------------------
Rotinas   :
Data      : 12/07/2016
Autor     : Darivaldo Alencar
SIG       : 20724
Descrição : Criação de Relatório: Consulta - log de auditoria
---------------------------------------------------------------------------------
*********************************************************************************}
unit fRelLogAuditoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, CheckLst, wwdbedit, Wwdotdot, Wwdbcomb, Mask,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Db, Wwdatsrc, DBTables, Wwquery, DBClient, uCmControlObject,
  DBCtrls, wwstorep, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, jpeg, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache,FTelaAut,
  uCmSqlParams, uCMClientDataSet, Provider, Wwtable,dBasedados,uSistema,
  ppStrtch, ppMemo,fPreviewExport, ComCtrls, wwdblook, CMDBLookupCombo,
  ppParameter;

type
  TfrmRelLogAuditoria = class(TfrmOkCancelar)
    qryTabela: TwwQuery;
    qryCampos: TwwQuery;
    pReport: TppReport;
    pPipeline: TppDBPipeline;
    dsReport: TwwDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel13: TppLabel;
    lblTotReg: TppLabel;
    ppImage1: TppImage;
    lblTabela: TppLabel;
    ppLabel17: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    lblDataIni: TppLabel;
    lblDataFim: TppLabel;
    qryRel: TwwQuery;
    lblBase: TppLabel;
    lblUsuario: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine6: TppLine;
    Bevel1: TBevel;
    Label1: TLabel;
    edUsuario: TEdit;
    Bevel2: TBevel;
    Label2: TLabel;
    memCondicao: TMemo;
    Bevel3: TBevel;
    Label3: TLabel;
    clbxCampos: TCheckListBox;
    Bevel4: TBevel;
    Label4: TLabel;
    cbTabela: TCMDBLookupCombo;
    Bevel5: TBevel;
    Label5: TLabel;
    dtpHini: TDateTimePicker;
    dtpDataIni: TDateTimePicker;
    Bevel6: TBevel;
    dtpDataFim: TDateTimePicker;
    dtpHfim: TDateTimePicker;
    Label6: TLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    lblCondicoes: TppLabel;
    lblUsuFiltro: TppLabel;
    memCampos: TppMemo;
    ppLabel16: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppParameterList1: TppParameterList;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure pReportBeforePrint(Sender: TObject);
    procedure dtpHiniExit(Sender: TObject);
    procedure dtpHfimExit(Sender: TObject);
    procedure dtpDataFimExit(Sender: TObject);
    procedure cbTabelaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    fTotReg: integer;
    fSselecao: String;
    procedure MontarCampos;
    procedure CamposSelecionados;
    function  ValidaEntrada: boolean;
    function  PossuiPermissao: boolean;
    function ValidaIntervalo : boolean;

  public
    property iTotReg: integer read fTotReg write fTotReg;
    property sSselecao: string read fSselecao write fSselecao;
  end;

var
  frmRelLogAuditoria: TfrmRelLogAuditoria;

implementation                           

{$R *.DFM}

procedure TfrmRelLogAuditoria.FormShow(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;

  qryTabela.close;
  qryTabela.sql.clear;
  qryTabela.sql.add('SELECT IDUSUARIO,NOMETABELA FROM logplanus.USUARIOXTABELA WHERE IDUSUARIO = ');
  qryTabela.sql.add(InttoStr(sistema.IdUsuario));
  qryTabela.sql.add(' ORDER BY NOMETABELA');
  qryTabela.open;
end;

procedure TfrmRelLogAuditoria.bbtnConfirmarClick(Sender: TObject);
var
   sUser,sCondicao: string;
begin
  //inherited;
  dtpDataIni.Time:= dtpHini.Time;
  dtpDataFim.Time:= dtpHFim.Time;

  if not (ValidaEntrada) then
    exit;

    sUser:= edUsuario.Text;
    sCondicao:= memCondicao.Lines.GetText;
    try
        dtmBasedados.dbBaseDados.StartTransaction;

        CamposSelecionados;

        qryRel.close;
        qryRel.SQL.Clear;

        qryRel.SQL.Add('call logplanus.PR_GERARELATORIO('+QuotedStr(cbTabela.Text)+','
                                                         +QuotedStr(DateTimeToStr(dtpDataIni.DateTime))+','
                                                         +QuotedStr(DateTimeToStr(dtpDataFim.DateTime))+','
                                                         +QuotedStr(sUser)+','
                                                         +QuotedStr(sSselecao)+','
                                                         +QuotedStr(sCondicao)+')'
                                                         );
        try
          qryRel.ExecSQL;
        except on e: exception do
         begin
           MessageDlg('Erro de Parametrização: '+e.Message, mtError,[mbOK],0);
           dtmBasedados.dbBaseDados.Rollback;
           exit;
         end;
        end;

        qryRel.close;
        qryRel.SQL.Clear;
        qryRel.SQL.Add(' SELECT count(1) AS QTDE ');
        qryRel.SQL.Add(' FROM LOGPLANUS.RELATORIO_LOG');
        qryRel.open;

        iTotReg:= qryRel.FieldByname('QTDE').asInteger;
        //iTotReg:= qryRel.recordCount; retorna -1

        qryRel.close;
        qryRel.SQL.Clear;
        qryRel.SQL.Add('SELECT ID_TABELALOG, OPERACAO, USUARIO, DATA_HORA, NOME_TABELA,');
        qryRel.SQL.Add('       substr(CHAVE_TABELA,1,100) AS CHAVE_TABELA, NOME_CAMPO, substr(VALOR_ANTERIOR,1,200) AS VALOR_ANTERIOR, substr(VALOR_ALTERADO,1,200) AS VALOR_ALTERADO '); //Peterson Victor SIG29865
        qryRel.SQL.Add('  FROM LOGPLANUS.RELATORIO_LOG');
        qryRel.open;

        if (iTotReg = 0) then
           begin
             MessageDlg('Não foram encontradas alterações dentro do período '+#13+'informado ou que atendam aos critérios de pesquisa',mtWarning,[mbok],0);
             dtmBasedados.dbBaseDados.Rollback;
             exit;
           end;

        TFrmPreviewExport.CreateModalPreviewExp(Application,
                                                   pReport,
                                                   'Consulta Log de Auditoria',
                                                   qryRel);
        dtmBasedados.dbBaseDados.Commit;
    except on e: Exception do
      dtmBasedados.dbBaseDados.Rollback;
    end;
end;

procedure TfrmRelLogAuditoria.MontarCampos;
begin
  clbxCampos.Items.Clear;
  
  if (qryCampos.IsEmpty) then
      exit;

  qryCampos.first;
   while not(qryCampos.eof) do
    begin
      clbxCampos.items.add(qryCampos.fieldbyname('column_name').asString);
      qryCampos.next;
    end;
end;

function TfrmRelLogAuditoria.ValidaEntrada: boolean;
begin
  result:= false;

  if not(PossuiPermissao) then
    begin
      MessageDlg('Usuário Sem Permissão Para Consultar Tabela!',mtWarning,[mbOk],0);
      exit;
    end;

   if (dtpDataIni.DateTime > dtpDataFim.DateTime) then
     begin
        MessageDlg('A Data Inicial Não Pode ser Superior a Data Final!',mtWarning,[mbOk],0);
        exit;
     end;

  if (cbTabela.Text='') or (cbTabela.Text=' ') then
   begin
     MessageDlg('Informe o nome da tabela.',mtWarning,[mbOk],0);
     cbTabela.setfocus;
     exit;
   end;

   if not ValidaIntervalo() then
      exit;
      
   result:= true;
end;


procedure TfrmRelLogAuditoria.CamposSelecionados;
var
   i: integer;
begin
  sSselecao:= '';
  for i:= 0 to clbxCampos.Items.Count - 1 do
    begin
      if(clbxCampos.Checked[i]) then
        begin
           if (sSselecao ='') then
              sSselecao := clbxCampos.Items[i]
           else
              sSselecao := sSselecao + ',' + clbxCampos.Items[i];
        end;
    end;
end;

procedure TfrmRelLogAuditoria.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  clbxCampos.Items.Clear;
  memCondicao.Lines.Clear;
  edUsuario.Clear;
  dtpDataIni.date:= Date;
  dtpDataFim.date:= Date;
  dtpHIni.Time   := Time - StrToTime('1:00:00');
  dtpHFim.Time   := Time;
  if (dtmBasedados.dbBaseDados.InTransaction) then
     dtmBasedados.dbBaseDados.Rollback;
  dtpDataIni.SetFocus;
end;

procedure TfrmRelLogAuditoria.pReportBeforePrint(Sender: TObject);
begin
  inherited;
  memCampos.lines.clear;
  memCampos.Lines.Add(sSselecao);
  lblBase.Caption      := UpperCase(Sistema.AliasServidor);
  lblDataIni.Caption   := FormatDateTime('dd/mm/yyyy HH:MM:SS',dtpDataIni.DateTime);
  lblDataFim.Caption   := FormatDateTime('dd/mm/yyyy HH:MM:SS',dtpDataFim.DateTime);
  lblTotReg.Caption    := IntToStr(iTotReg);
  lblTabela.Caption    := cbTabela.Text;
  lblUsuario.Caption   := Sistema.NomeUsuario;
  lblCondicoes.Caption := memCondicao.Lines.GetText;
  lblUsuFiltro.Caption := edUsuario.Text;
end;

function TfrmRelLogAuditoria.PossuiPermissao: boolean;
begin
  qryRel.close;
  qryRel.sql.clear;
  qryRel.sql.add('SELECT COUNT(1)  FROM logplanus.USUARIOXTABELA WHERE IDUSUARIO = ' + IntToStr(Sistema.IdUsuario));
  qryRel.open;

  if (qryRel.fields[0].asInteger > 0) then
     result:= true
  else
     result:= false;
end;

procedure TfrmRelLogAuditoria.dtpHiniExit(Sender: TObject);
begin
  inherited;
  if (TimeToStr(dtpHini.Time) >= '23:00:00') then
    dtpDataFim.Date := dtpDataFim.Date + 1
  else
    dtpDataFim.Date:= dtpDataIni.Date;

  dtpHFim.Time :=  dtpHIni.Time + StrtoTime('1:00:00');
end;

procedure TfrmRelLogAuditoria.dtpHfimExit(Sender: TObject);
begin
  inherited;
//  if not ValidaIntervalo then
//     exit;
end;

function TfrmRelLogAuditoria.ValidaIntervalo : boolean;

function AceitarIntervalo: boolean;
begin
   if MessageDlg('A geração do relatório para intervalos superiores'+#13 +
                 'ao sugerido podem acarretar em um longo tempo de espera.'+#13+
                 'Deseja continuar?',mtConfirmation,[mbYes,mbNo],0) = idYes then
     begin
       cbTabela.setfocus;
       result:= true;
     end
   else
     begin
       bbtnCancelar.click;
       result:= false;
     end;
end;
var
  dIni, dFim: tDate;
  hIni,hFim: TTime;

begin
  result := true;

  dIni:= StrToDate(FormatDateTime('dd/mm/yyyy',dtpDataIni.date));
  dFim:= StrToDate(FormatDateTime('dd/mm/yyyy',dtpDataFim.date));
  hIni:= StrToTime(TimeToStr(dtpHini.Time));
  hFim:= StrToTime(TimeToStr(dtpHfim.Time));

  if (dIni <> dFim) then
    begin
      if (hFim <= StrtoTime('2:00:00')) and (hIni >= StrtoTime('22:00:00')) then
        begin
           if (Abs(hFim - hIni) < StrtoTime('22:00:00')) then
              result:= AceitarIntervalo;
        end
      else
        result:= AceitarIntervalo;
    end
  else
    if ((hFim - hIni) > StrtoTime('2:00:00')) then
        result:= AceitarIntervalo;
end;

procedure TfrmRelLogAuditoria.dtpDataFimExit(Sender: TObject);
begin
  inherited;
  if (dtpDataIni.Date> dtpDataFim.Date) then
     dtpDataFim.setfocus;
end;

procedure TfrmRelLogAuditoria.cbTabelaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryCampos.close;
  qryCampos.sql.Clear;
  qryCampos.SQL.add(' Select column_name                                    '+
                    ' from all_tab_columns                                  '+
                    ' where owner = ''CM'' and                              '+
                    ' table_name = ' + QuotedStr(trim(cbTabela.text))        +
                    ' and column_name not in (''TRGDTALTERACAO'',''TRGUSERALTERACAO'')'+
                    ' order by column_name                                  ');
  qryCampos.open;
  MontarCampos;
end;

end.
