// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{
 Pendência   : SOL 263865 PPM 1128277
 Responsável : Peterson victor
 Data        : 06/11/2015
 Descrição   : Não inserir registros nas tabelas EVENTOSPREV, PARTOPREVPLAN e RESERVAPART
--------------------------------------------------------------------------------
 Pendência   : SOL 179143 KINTANA 1653010
 Responsável : BRUNO AZEVEDO
 Data        : 04/05/2012
 Descrição   : Ajustes ao alterar o percentual em lote das contribuiçõe.
--------------------------------------------------------------------------------
 Autor(a)    : Fernando Xavier
 Data        : 20/05/2011
 Pendência   : SOL 136169 Kintana 840846
 Alteração   : solicito alteração no aplicativo de alteração de percentual e lote referente ao SOL 127144
------------------------------------------------------------------------------
 Autor(a)    : Renato Visoni
 Data        : 05/04/2010
 Pendência   : SOL 127144 Kintana 670910
 Alteração   : Criaçã da funcionalidade "Alteração de Percentual de Contribuição em Lote"
------------------------------------------------------------------------------
}
unit uAltPercContribLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,FTelaAut,DBaseDados,
  QExport3Dialog, QExport3, QExport3PDF, QExport3XLS, QExport3LaTeX,
  ppPrnabl, ppClass, ppCtrls, ppDB, ppBands, ppCache, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppReport, DBGrids, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmAltPercContribLote = class(TfrmCadastroCS)
    GroupBox1: TGroupBox;
    grdHistorico: TwwDBGrid;
    QryHstContrib: TQuery;
    dsHstContrib: TDataSource;
    QExportPDF: TQExport3PDF;
    QExportXLS: TQExport3XLS;
    GroupBox2: TGroupBox;
    chkpdf: TCheckBox;
    chktxt: TCheckBox;
    chkXls: TCheckBox;
    chkRelatorio: TCheckBox;
    btnArquivo: TSpeedButton;
    ppRelatorio: TppReport;
    DsRelatorio: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    btnExcluir: TBitBtn;
    btnLimpar: TBitBtn;
    QryAux: TwwQuery;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    QryRelatorio: TQuery;
    DataSource1: TDataSource;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel8: TppLabel;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    ppLblDataCaixa: TppLabel;
    QryRelatorio_aux: TQuery;
    ppLabel14: TppLabel;
    qryAux2: TwwQuery;
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure ListaHistorico();
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure QryHstContribAfterScroll(DataSet: TDataSet);
    procedure btnLimparClick(Sender: TObject);
    procedure ppLabel14Print(Sender: TObject);
  private
    { Private declarations }
  public
    lstCampos       : TStringList;
    lstProcessados  : TStringList;
    Procedure GeraArquivo(sNomeArquivo:String);
    procedure insereparticipante(sidPessJur,
                                 sIdplanoprev,
                                 sIdPessoa,
                                 sMatricula,
                                 sDtInscricao,
                                 sNovoPercentual,
                                 sIdContribuicao :String); //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
    function  ParticipanteProcessado(sSQL : String): Boolean;

    { Public declarations }
  end;

var
  FrmAltPercContribLote: TFrmAltPercContribLote;
  sdatacaixa : tdate;
implementation
uses uBuscaContribPartLote, UFuncoesEmptmo, uSistema,uMensErro,uFuncoesUteis;

{$R *.DFM}

procedure TFrmAltPercContribLote.sbtnInserirClick(Sender: TObject);

begin
  //inherited;
  
  try
    Application.CreateForm(TFrmBuscaContribPartLote,FrmBuscaContribPartLote);
    FrmBuscaContribPartLote.FormStyle := fsNormal;
    FrmBuscaContribPartLote.Show;
  except
  end;

  sbtnInserir.Down   := False;

end;

procedure TFrmAltPercContribLote.FormCreate(Sender: TObject);
begin
  //inherited;

  lstCampos :=  TStringList.Create();

end;

procedure TFrmAltPercContribLote.FormShow(Sender: TObject);
begin
  //inherited;

end;

procedure TFrmAltPercContribLote.sbtnProcurarClick(Sender: TObject);
var sSQL : string;
begin
  //inherited;

end;

procedure TFrmAltPercContribLote.insereparticipante(sidPessJur,
                                                    sIdplanoprev,
                                                    sIdPessoa,
                                                    sMatricula,
                                                    sDtInscricao,
                                                    sNovoPercentual,
                                                    sIdContribuicao:String); //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
var   sSQL : string;
begin
  //////////Inscreve Participante
  sSQL :='';

  sSQL :=
  'INSERT INTO PARTPREVPLAN'+
  '          (IDPESSJUR,IDPLANOPREV,IDPESSOA,SEQPROPOSTA,IDSITPART,'+
  '          IDSITPLANOPREV,INSCRICAONUMERO,INSCRICAODATA,INSCRICAOTIPO,'+
  '          SALINSCRICAO,SALPARTICIPACAO,SALMANTIDO,SALVINCULADO,VALORCALCINSS,'+
  '          FLGDEVEEMPRESTIMO,FLGDEVEASSISTENC,FLGDEVEPREVIDENC,VALORINFINSS,'+
  '          SALAUXDOENCA,DATAINICIOSITTEMP,DATAFIMSITTEMP,DATAINICIOMANUT,'+
  '          REQUERIMENTODATA,DTINICIOINSC,FLGFITESPECIAL,FLGDESATIVADO,'+
  '          PARTPREVPLAN.TIPOOPCAOIR, PARTPREVPLAN.DATAOPCAOIR,'+
  '          TRGDTINCLUSAO,TRGUSERINCLUSAO,FLGINSCRICAOLOTE) '+
  '          VALUES (                     '+
  '          '+sIdPessJur+'        ,      '+
  '          '+sIdplanoprev+',   '+
  '          '+sIdPessoa+',                '+
  '          1,                           '+
  '          1,                           '+
  '          1,                           '+
  '          '+sMatricula+',       '+
  '          '+sDtInscricao+',        '+
  '          NULL,                        '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          0,                           '+
  '          NULL,                        '+
  '          NULL,                        '+
  '          NULL,                        '+
  '          NULL,                        '+
  '          '+sDtInscricao+','+
  '          0,                           '+
  '          0 ,                          '+
  '          NULL,                        '+
  '          '+sDtInscricao+',        '+
  '          SYSDATE,                     '+
  '          USER,                        '+
  '          1                        '+
  '          )';

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);


  try
     QryAux.ExecSQL;
  except
  end;


   sSQL:='';
   sSQL:=
  'INSERT INTO EVENTOSPREV EV '+
  '(ideventosprev, idsitplanoatual, idpessoa, idsitfuncatual,'+
  'ideventogerador, idpessjur, idsitpartatual, idplanoprev, idsitplanonovo,'+
  'idsitpartnovo, dataregistro, dataevento, flgefetivado, dataefetivado, idsitfuncnovo,'+
  'seqproposta, trgdtinclusao, trguserinclusao, inscricaonumero, datarequerimento, matricula)'+
  'VALUES(                    '+
  'SEQEVENTOSPREV.NEXTVAL,    '+
  '1,                         '+
  '          '+sidPessoa+',    '+
  '1,                         '+
  '1,                         '+
  '          '+sidPessJur+',  '+
  '1,                         '+
  ''+sIdplanoprev+', '+
  '1,                         '+
  '1,                         '+
  'SYSDATE,                   '+
  ''+sdtInscricao+',      '+
  '1,                         '+
  ''+sdtInscricao+',      '+
  '1,                         '+
  '1,                         '+
  'SYSDATE,                   '+
  'USER,                      '+
  ''+sMatricula+',     '+
  ''+sDtInscricao+',      '+
  ''+sMatricula+'      '+
  ')                          ';
  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  try
     QryAux.ExecSQL;
  except
  end;

  sSQL :='';
  sSQL :=
  'INSERT INTO CONTRIBPREVPARTP CP '+
  '(CP.IDPESSJUR, CP.IDTPPERIODICIDADE, CP.IDPESSOA, CP.IDPLANOPREV,'+
  'CP.SEQPROPOSTA,  CP.IDCONTRIBUICAO, CP.FLGCOBRA, CP.FLGDESCFOLHA,'+
  'CP.FLGRETROATIVO , CP.DATAINICIO, CP.FLGRECALCULA,'+
  'CP.IDHISTPROPOSTA, CP.ULTMESPREPARO, CP.TRGDTINCLUSAO, CP.TRGUSERINCLUSAO,'+
  'CP.VALORBASE1)'+
  'VALUES'+
  '(      '+
  sidPessJur+',               '+
  '1,                         '+
  sidPessoa+',                 '+
  sIdplanoprev+',    '+
  '1,                         '+
  '1,                         '+
  '1,                         '+
  '1,                         '+
  '1,                         '+
  sdtInscricao +','+
  '1,                         '+
  '0,                         '+
  ' ''0000/00'' ,             '+
  'sysdate,                   '+
  'USER,                      '+
  StringReplace(sNovoPercentual,',','.',[rfReplaceall]) +')'   ;

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  try
     QryAux.ExecSQL;
  except
  end;

  sSQL :='';
  sSQL :=
  'INSERT INTO CONTRIBPREVPARTP CP '+
  '(CP.IDPESSJUR, CP.IDTPPERIODICIDADE, CP.IDPESSOA, CP.IDPLANOPREV,'+
  'CP.SEQPROPOSTA,  CP.IDCONTRIBUICAO, CP.FLGCOBRA, CP.FLGDESCFOLHA,'+
  'CP.FLGRETROATIVO , CP.DATAINICIO, CP.FLGRECALCULA,'+
  'CP.IDHISTPROPOSTA, CP.ULTMESPREPARO, CP.TRGDTINCLUSAO, CP.TRGUSERINCLUSAO,'+
  'CP.VALORBASE1)'+
  'VALUES'+
  '(      '+
  sidPessJur+',               '+
  '1,                         '+
  sidPessoa+',                 '+
  sIdplanoprev+',    '+
  '1,                         '+
  '21,                        '+
  '1,                         '+
  '1,                         '+
  '1,                         '+
  sdtInscricao +','+
  '1,                         '+
  '0,                         '+
  ' ''0000/00'' ,             '+
  'sysdate,                   '+
  'USER,                      '+
  sNovoPercentual+')'   ;

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  try
     QryAux.ExecSQL;
  except
  end;

  sSQL :='';
  sSQL :=
  ' INSERT INTO RESERVAPART'+
  ' (IDTIPORESERVA, IDPLANOPREV, IDPESSOA , IDPESSJUR, DATAREFERENCIASA,'+
  ' SEQPROPOSTA, VALORRESERVA, FLGATIVO, FLGINCONSISTENCIA, IDPARTICIPANTE, trgdtinclusao, trguserinclusao)'+
  ' SELECT DISTINCT RP.IDTIPORESERVA , RP.IDPLANOPREV, P.IDPESSOA, P.IDPESSJUR,'+
  sdtInscricao +
  ' , 1, 0, 1, 0,P.IDPESSOA AS IDPARTICIPANTE,'+
  ' SYSDATE,'+
  ' USER'+
  ' FROM PARTPREVPLAN P, RESERVAXPLANO RP, RESERVAXCONTRIB RC, CONTRIBPREVPARTP CP'+
  ' WHERE P.IDPESSJUR = CP.IDPESSJUR AND'+
  ' P.IDPLANOPREV = CP.IDPLANOPREV AND'+
  ' P.IDPLANOPREV ='+ sIdplanoprev +' AND'+
  ' P.IDPESSJUR = '+sidPessJur+' AND'+
  ' P.IDPESSOA = CP.IDPESSOA AND'+
  ' RP.IDPLANOPREV = P.IDPLANOPREV AND'+
  ' RP.ANALITICOSINTETI = ''A'' AND'+
  ' NVL(RP.FLGCOLETIVA,0) = 0 AND'+
  ' RC.IDPLANOPREV = RP.IDPLANOPREV AND'+
  ' RC.IDTIPORESERVA = RP.IDTIPORESERVA AND'+
  ' CP.IDCONTRIBUICAO IN (1,21) AND'+
  ' CP.IDCONTRIBUICAO = RC.IDCONTRIBUICAO    AND'+
  ' P.IDPESSOA   ='+ sidPessoa +
  ' AND NOT EXISTS'+
  ' (SELECT 1'+
  ' FROM RESERVAPART R'+
  ' WHERE'+
  ' R.IDPESSJUR = P.IDPESSJUR AND'+
  ' R.IDPLANOPREV = P.IDPLANOPREV AND'+
  ' R.IDPESSOA = P.IDPESSOA AND'+
  ' R.IDTIPORESERVA = RP.IDTIPORESERVA AND'+
  ' R.IDPLANOPREV = RP.IDPLANOPREV )'+
  ' ORDER BY P.IDPESSOA';

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(sSQL);
  try
     QryAux.ExecSQL;
  except
  end;

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(' INSERT INTO HSTPERCONTRIBPREV ');
  QryAux.SQL.Add(' (IDHSTPERCONTRIBPREV,');
  QryAux.SQL.Add(' IDPESSJUR,');
  QryAux.SQL.Add(' IDPESSOA,');
  QryAux.SQL.Add(' IDPLANOPREV,');
  QryAux.SQL.Add(' IDCONTRIBUICAO,');
  QryAux.SQL.Add(' DTINICIO,');
  QryAux.SQL.Add(' DTFIM,');
  QryAux.SQL.Add(' PERCENTUAL,');
  QryAux.SQL.Add(' SEQPROPOSTA )VALUES( ');

  QryAux.SQL.Add('SEQHSTPERCONTRIBPREV.NEXTVAL,');
  QryAux.SQL.Add(Trim(sidPessJur)+',');
  QryAux.SQL.Add(Trim(sidPessoa)        +',');
  QryAux.SQL.Add(Trim(sIdplanoprev) +',');
  //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
  //QryAux.SQL.Add(Trim('1')  +',');
  QryAux.SQL.Add(Trim(sIdContribuicao)  +',');
  //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
  QryAux.SQL.Add(Trim(sdtInscricao) +',');
 // QryAux.SQL.Add('(SELECT TO_DATE(''01/''||TO_CHAR(TO_DATE('+QuotedStr(dtInscricao.Text)+',''DD/MM/YYYY''),''MM/YYYY''),''DD/MM/YYYY'')-1 FROM DUAL),');
  QryAux.SQL.Add('NULL,');
  QryAux.SQL.Add(Trim(StringReplace(sNovoPercentual,',','.',[rfReplaceall])) +',');
  QryAux.SQL.Add('1)');
  try
     QryAux.ExecSQL;
  except
  end;
end;



procedure TFrmAltPercContribLote.ListaHistorico;
var i : Integer;
begin
  if lstCampos.Count > 0 then begin
    QryHstContrib.Close;
    QryHstContrib.SQL.Clear;

    for i:=0 to lstCampos.count-1 do begin

      QryHstContrib.SQL.Add(' SELECT ');
      QryHstContrib.SQL.Add(lstCampos[i]);
      QryHstContrib.SQL.Add(' FROM DUAL ');

      if i <> lstCampos.count-1 then begin
        QryHstContrib.SQL.Add(' UNION ');
      end;
    end;
    QryHstContrib.SQL.Add('GROUP BY 1,2,3,4,5,6,7,8,9,10');

    QryHstContrib.Open;
    bbtnConfirmar.Enabled := True;
    btnArquivo.Visible    := False;

    QryHstContrib.DisableControls;
    QryHstContrib.Filter   := 'IDCONTRIBUICAO = 1';
    QryHstContrib.Filtered := True;
    QryHstContrib.EnableControls;


    QryHstContrib.SQL.SaveToFile(sistema.RetornaCaminhoArquivos(sistema.IdEmpresa)+'\BackupALteracaoPercentualLote'+StringReplace(Copy(dateTostr(Now),7,4)+''+Copy(dateTostr(Now),4,2),'/','',[rfReplaceall])+'.TXT');
  end;

end;

procedure TFrmAltPercContribLote.bbtnConfirmarClick(Sender: TObject);
var icount : Integer;
    QryUpd : TwwQuery;
    QryAux : TwwQuery;

begin
  //inherited;

  // parametros a serem passados abaixo
  //sidPessJur,sIdplanoprev,sIdPessoa,sMatricula,sDtInscricao,sTipoopcaoir,sNovoPercentual


  icount :=0;

  QryUpd              := TwwQuery.Create(nil);
  QryUpd.DatabaseName :='BaseDados';

  QryAux := TwwQuery.Create(nil);
  QryAux.DatabaseName :='BaseDados';

  MostraFormProgresso('Atualizando Percentual de Contribuição...', 0, QryHstContrib.RecordCount, False, False);

  QryHstContrib.DisableControls;

  QryHstContrib.Filter   := '';
  QryHstContrib.Filtered := True;

  QryRelatorio.Close;
  QryRelatorio.ParamByname('PDTINICIO').asDateTime := dtInicio.Date;
  QryRelatorio.ParamByname('PDATAFIM').asDateTime    := dtFim.Date;
  QryRelatorio.Open;
  QryRelatorio.first;


  QryHstContrib.First;

  While not QryHstContrib.eof do begin
    if not(dtmBaseDados.dbBaseDados.InTransaction)then
      dtmBaseDados.dbBaseDados.StartTransaction;

    QryAux2.Close;
    QryAux2.SQL.CLear;
    QryAux2.SQL.Add('SELECT count(*) qnt FROM HSTPERCONTRIBPREV');
    QryAux2.SQL.Add(' WHERE IDPESSJUR    = '+Trim(QryHstContrib.FieldByName('IDPESSJUR').asString));
    QryAux2.SQL.Add(' AND IDPESSOA       = '+Trim(QryHstContrib.FieldByName('IDPESSOA').asString));
    QryAux2.SQL.Add(' AND IDPLANOPREV    = '+Trim(QryHstContrib.FieldByName('IDPLANOPREV').asString));
    QryAux2.SQL.Add(' AND IDCONTRIBUICAO = '+Trim(QryHstContrib.FieldByName('IDCONTRIBUICAO').asString));
    QryAux2.Open;

    // Peterson Victor SOL 263865 PPM 1128277
    {
    //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
    if QryAux2.fieldbyname('qnt').asinteger = 0 then begin
     // fazer o loop aqui
     insereparticipante(QryHstContrib.FieldByName('IDPESSJUR').asString,
                        QryHstContrib.FieldByName('IDPLANOPREV').asString,
                        QryHstContrib.FieldByName('IDPESSOA').asString,
                        QuotedStr(QryHstContrib.FieldByName('MATRICULA').asString),
                        QuotedStr(QryHstContrib.FieldByName('INSCRICAODATA').asString),
                        QryHstContrib.FieldByName('PERCENTUAL_NOVO').asString,
                        //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
                        QryHstContrib.FieldByName('IDCONTRIBUICAO').asString) ;
                        //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
    end;
    }

    QryAux2.Close;
    QryAux2.SQL.CLear;
    QryAux2.SQL.Add('SELECT count(*) qnt FROM HSTPERCONTRIBPREV');
    QryAux2.SQL.Add(' WHERE IDPESSJUR    = '+Trim(QryHstContrib.FieldByName('IDPESSJUR').asString));
    QryAux2.SQL.Add(' AND IDPESSOA       = '+Trim(QryHstContrib.FieldByName('IDPESSOA').asString));
    QryAux2.SQL.Add(' AND IDPLANOPREV    = '+Trim(QryHstContrib.FieldByName('IDPLANOPREV').asString));
    QryAux2.SQL.Add(' AND IDCONTRIBUICAO = '+Trim(QryHstContrib.FieldByName('IDCONTRIBUICAO').asString));
    QryAux2.Open;
    //BRUNO AZEVEDO SOL 179143 KINTANA 1653010

    if QryAux2.fieldbyname('qnt').asinteger = 0 then begin
      //PERCENTUAL NOVO
      QryUpd.Close;
      QryUpd.SQL.Clear;
      QryUpd.SQL.Add(' INSERT INTO HSTPERCONTRIBPREV ');
      QryUpd.SQL.Add(' (IDHSTPERCONTRIBPREV,');
      QryUpd.SQL.Add(' IDPESSJUR,');
      QryUpd.SQL.Add(' IDPESSOA,');
      QryUpd.SQL.Add(' IDPLANOPREV,');
      QryUpd.SQL.Add(' IDCONTRIBUICAO,');
      QryUpd.SQL.Add(' DTINICIO,');
      QryUpd.SQL.Add(' DTFIM,');
      QryUpd.SQL.Add(' PERCENTUAL,');
      QryUpd.SQL.Add(' SEQPROPOSTA )VALUES( ');

      QryUpd.SQL.Add('SEQHSTPERCONTRIBPREV.NEXTVAL,');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDPESSJUR').asString)       +',');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDPESSOA').asString)        +',');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDPLANOPREV').asString)     +',');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDCONTRIBUICAO').asString)  +',');
      QryUpd.SQL.Add(Trim(QuotedStr(QryHstContrib.FieldByName('INSCRICAODATA').asString)) +',');
      QryUpd.SQL.Add('(SELECT TO_DATE('+Trim(QuotedStr(QryHstContrib.FieldByName('DATA').asString))+')-1 FROM DUAL ),');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('PERCETUAL_ATUAL').asString) +',');
      QryUpd.SQL.Add('1)');
      QryUpd.ExecSQL;

      //PERCENTUAL ATUAL
      QryUpd.Close;
      QryUpd.SQL.Clear;
      QryUpd.SQL.Add(' INSERT INTO HSTPERCONTRIBPREV ');
      QryUpd.SQL.Add(' (IDHSTPERCONTRIBPREV,');
      QryUpd.SQL.Add(' IDPESSJUR,');
      QryUpd.SQL.Add(' IDPESSOA,');
      QryUpd.SQL.Add(' IDPLANOPREV,');
      QryUpd.SQL.Add(' IDCONTRIBUICAO,');
      QryUpd.SQL.Add(' DTINICIO,');
      QryUpd.SQL.Add(' DTFIM,');
      QryUpd.SQL.Add(' PERCENTUAL,');
      QryUpd.SQL.Add(' SEQPROPOSTA )VALUES( ');

      QryUpd.SQL.Add('SEQHSTPERCONTRIBPREV.NEXTVAL,');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDPESSJUR').asString)       +',');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDPESSOA').asString)        +',');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDPLANOPREV').asString)     +',');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDCONTRIBUICAO').asString)  +',');
      QryUpd.SQL.Add(Trim(QuotedStr(QryHstContrib.FieldByName('DATA').asString)) +',');
      QryUpd.SQL.Add('NULL,');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('PERCENTUAL_NOVO').asString) +',');
      QryUpd.SQL.Add('1)');
      QryUpd.ExecSQL;

    end else begin

      QryUpd.Close;
      QryUpd.SQL.Clear;
      //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
      //QryUpd.SQL.Add(' UPDATE HSTPERCONTRIBPREV  SET DTFIM = (SELECT ADD_MONTHS(DTINICIO,1)-1 FROM DUAL) ');
      QryUpd.SQL.Add(' UPDATE HSTPERCONTRIBPREV  SET DTFIM = ' + Trim(QuotedStr(QryHstContrib.FieldByName('DATA').asString)));
      //BRUNO AZEVEDO SOL 179143 KINTANA 1653010
      QryUpd.SQL.Add(' WHERE IDPESSJUR    = '+Trim(QryHstContrib.FieldByName('IDPESSJUR').asString));
      QryUpd.SQL.Add(' AND IDPESSOA       = '+Trim(QryHstContrib.FieldByName('IDPESSOA').asString));
      QryUpd.SQL.Add(' AND IDPLANOPREV    = '+Trim(QryHstContrib.FieldByName('IDPLANOPREV').asString));
      QryUpd.SQL.Add(' AND IDCONTRIBUICAO = '+Trim(QryHstContrib.FieldByName('IDCONTRIBUICAO').asString));
      QryUpd.SQL.Add(' AND DTFIM IS NULL');
      QryUpd.ExecSQL;

      QryUpd.Close;
      QryUpd.SQL.Clear;
      QryUpd.SQL.Add(' INSERT INTO HSTPERCONTRIBPREV ');
      QryUpd.SQL.Add(' (IDHSTPERCONTRIBPREV,');
      QryUpd.SQL.Add(' IDPESSJUR,');
      QryUpd.SQL.Add(' IDPESSOA,');
      QryUpd.SQL.Add(' IDPLANOPREV,');
      QryUpd.SQL.Add(' IDCONTRIBUICAO,');
      QryUpd.SQL.Add(' DTINICIO,');
      QryUpd.SQL.Add(' DTFIM,');
      QryUpd.SQL.Add(' PERCENTUAL,');
      QryUpd.SQL.Add(' SEQPROPOSTA )VALUES( ');

      QryUpd.SQL.Add('SEQHSTPERCONTRIBPREV.NEXTVAL,');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDPESSJUR').asString)       +',');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDPESSOA').asString)        +',');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDPLANOPREV').asString)     +',');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('IDCONTRIBUICAO').asString)  +',');
      QryUpd.SQL.Add(Trim(QuotedStr(QryHstContrib.FieldByName('DATA').asString)) +',');
      QryUpd.SQL.Add('NULL,');
      QryUpd.SQL.Add(Trim(QryHstContrib.FieldByName('PERCENTUAL_NOVO').asString) +',');
      QryUpd.SQL.Add('1)');
      QryUpd.ExecSQL;

    end;


    QryUpd.Close;
    QryUpd.SQL.Clear;
    QryUpd.SQL.Add(' UPDATE CONTRIBPREVPARTP SET VALORBASE1 = ' + Trim(QryHstContrib.FieldByName('PERCENTUAL_NOVO').asString));
    QryUpd.SQL.Add(' WHERE ROWID ='+ QuotedStr(trim(QryHstContrib.FieldByName('IDROWID').asString)));
    QryUpd.ExecSQL;

    inc(iCount);
    AndaFormProgresso(iCount);

    QryHstContrib.Next;
  end;

  QryHstContrib.Filter   := 'IDCONTRIBUICAO=1';
  QryHstContrib.Filtered := True;



  QryHstContrib.EnableControls;


  EscondeFormProgresso;
  if dtmBaseDados.dbBaseDados.InTransaction
    then dtmBaseDados.dbBaseDados.Commit;


  QryUpd.Destroy;
  QryAux.Destroy;

  btnArquivo.Visible    := True;
  btnArquivo.Enabled    := True;

  bbtnConfirmar.Enabled := False;
  
  lstCampos.Clear;

  QryRelatorio.Close;
  QryRelatorio.ParamByname('PDTINICIO').asDateTime := dtInicio.Date;
  QryRelatorio.ParamByname('PDATAFIM').asDateTime    := dtFim.Date;
  QryRelatorio.Open;
  QryRelatorio.first;

end;

procedure TFrmAltPercContribLote.GeraArquivo(sNomeArquivo:String);
var F : TextFile;
    sLinha,sPercentual,sTipoArquivo,sPercent : String;
begin
  if QryRelatorio.Active then begin
    QryRelatorio.First;
    sLinha :='';

    AssignFile(F, sistema.RetornaCaminhoArquivos(sistema.IdEmpresa)+'\'+sNomeArquivo+'.TXT');
    ReWrite(F);

   if QryRelatorio.recordcount <= 0 then
   begin
      QryHstContrib.First;
      sLinha :='';
      While not QryHstContrib.Eof do begin
        if QryHstContrib.FieldByname('IDPESSJUR').asInteger = 91008 then begin
          if QryHstContrib.FieldByname('IDPLANOPREV').asInteger = 66 then begin
            sTipoArquivo := '13';
          end else if QryHstContrib.FieldByname('IDPLANOPREV').asInteger = 74 then begin
            sTipoArquivo := '15';
          end;

        sTipoArquivo := CompletaString(sTipoArquivo,'0',3,false);

        if strToFloat(copy(Trim(QryHstContrib.FieldByname('PERCENTUAL_NOVO').asString),pos('.',QryHstContrib.FieldByname('PERCENTUAL_NOVO').asString)+1, Length(QryHstContrib.FieldByname('PERCENTUAL_NOVO').asString)))=0 then begin
          sPercent := Copy(QryHstContrib.FieldByname('PERCENTUAL_NOVO').asString,1,pos('.',QryHstContrib.FieldByname('PERCENTUAL_NOVO').asString)-1);
        end else begin
          sPercent := QryHstContrib.FieldByname('PERCENTUAL_NOVO').asString;
        end;

          sPercent := FloatToStr(StrToFloat(sPercent) * 100);

          sPercentual := CompletaString(sPercent,'0',4,false); //Fernando Santana SOL 145293 Kintana 970786

          sLinha := Trim(copy(QryHstContrib.FieldByname('MATRICULA').asString,1,Length(QryHstContrib.FieldByname('MATRICULA').asString)-1))+''+
                    StringReplace(datetostr(sDataCaixa),'/','.',[rfReplaceall])+''+
                    sPercentual+''+
                    sTipoArquivo;

          WriteLn(F, sLinha);
        end;
        QryHstContrib.Next;
      end;
      CloseFile(F);
   end
   else
   begin
     While not QryRelatorio.Eof do begin
       if QryRelatorio.FieldByname('IDPESSJUR').asInteger = 91008 then begin
         if QryRelatorio.FieldByname('IDPLANOPREV').asInteger = 66 then begin
           sTipoArquivo := '13';
         end else if QryRelatorio.FieldByname('IDPLANOPREV').asInteger = 74 then begin
           sTipoArquivo := '15';
         end;

       sTipoArquivo := CompletaString(sTipoArquivo,'0',3,false);

       if strToFloat(copy(Trim(QryRelatorio.FieldByname('Percentual').asString),pos('.',QryRelatorio.FieldByname('Percentual').asString)+1, Length(QryRelatorio.FieldByname('Percentual').asString)))=0 then begin
         sPercent := Copy(QryRelatorio.FieldByname('Percentual').asString,1,pos('.',QryRelatorio.FieldByname('Percentual').asString)-1);
       end else begin
         sPercent := QryRelatorio.FieldByname('Percentual').asString;
       end;

       sPercent := FloatToStr(StrToFloat(sPercent) * 100);

         sPercentual := CompletaString(sPercent,'0',4,false); //Fernando Santana SOL 145293 Kintana 970786

         sLinha := Trim(copy(QryRelatorio.FieldByname('MATRICULA').asString,1,Length(QryRelatorio.FieldByname('MATRICULA').asString)-1))+''+
                   StringReplace(datetostr(sDataCaixa),'/','.',[rfReplaceall])+''+
                   sPercentual+''+
                   sTipoArquivo;

         WriteLn(F, sLinha);
       end;
       QryRelatorio.Next;
     end;
     CloseFile(F);
   end;
  end;



end;

procedure TFrmAltPercContribLote.btnArquivoClick(Sender: TObject);
var sNomeArquivo : String;
Auxdate : Tdate;
begin
  //inherited;

  Auxdate := now;

   {if Auxdate < StrToDate(('06'+FormatDateTime('/mm/yyyy',now))) then
      sdatacaixa := StrToDate('01'+FormatDateTime('/mm/yyyy',IncMonth(Auxdate,-1)))
   else
      sdatacaixa := StrToDate('01'+FormatDateTime('/mm/yyyy',Auxdate));

   if not DiasUteis.DiaUtil(Sistema.IdEmpresa,sdatacaixa, false,false,false) then
      sdatacaixa := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,sdatacaixa, false,false,false);}

  sdatacaixa             :=  uFuncoesUteis.F_Diasuteis();
  ppLblDataCaixa.Caption :=  datetostr(sdatacaixa);


  QryRelatorio.Close;
  QryRelatorio.parambyname('PDTINICIO').value := dtInicio.Date;
  QryRelatorio.parambyname('PDATAFIM').value  := dtfim.Date;
  QryRelatorio.open;

  QryHstContrib.DisableControls;

  
  QryHstContrib.Filter   := 'IDCONTRIBUICAO = 1';
  QryHstContrib.Filtered := True;
  
  sNomeArquivo := 'Alteração de Percentual'+''+StringReplace(Copy(dateTostr(Auxdate),7,4)+''+Copy(dateTostr(Auxdate),4,2),'/','',[rfReplaceall]);

  if chkPdf.checked then begin
    QExportPDF.FileName := sistema.RetornaCaminhoArquivos(sistema.IdEmpresa)+'\'+sNomeArquivo+'.PDF';
    QExportPDF.Execute;
  end;

  if chkTxt.checked then begin
    GeraArquivo(sNomeArquivo);
  end;

  if chkXLS.checked then begin
    QExportXLS.FileName := sistema.RetornaCaminhoArquivos(sistema.IdEmpresa)+'\'+sNomeArquivo+'.XLS';
    QExportXLS.Execute;
  end;


  if (chkPdf.checked) or (chkTxt.checked) or (chkXLS.checked) then begin
    MsgDlg('Arquivo(s) gerado(s) em '+sistema.RetornaCaminhoArquivos(sistema.IdEmpresa), 'Informação', mtConfirmation, [mbOk], 0);
  end;

  if chkRelatorio.checked then begin
    ppRelatorio.Print;
  end;

  QryHstContrib.EnableControls;


end;


function TFrmAltPercContribLote.ParticipanteProcessado(sSQL: String): Boolean;
var QryVerifica : TwwQuery;
begin

  if QryHstContrib.Active then begin
    QryVerifica              := TwwQuery.Create(nil);
    QryVerifica.DatabaseName :='BaseDados';

    QryVerifica.Close;
    QryVerifica.SQL.Clear;
    QryVerifica.SQL.Text :=  'SELECT COUNT(*) QTD FROM ' + '( '+QryHstContrib.SQL.Text+') WHERE ' + sSQL;
    QryVerifica.Open;

    Result := (QryVerifica.FieldByname('QTD').asInteger > 0);

    QryVerifica.Destroy;
  end else begin
    Result := False;
  end;
end;

procedure TFrmAltPercContribLote.btnExcluirClick(Sender: TObject);
var sSQL : String;
    sMatricula, sIdPlanoPrev : String;
    i : Integer;

begin
  inherited;

  if QryHstContrib.Active then begin
    sSQL         :='';
    sSQL         := QryHstContrib.SQL.Text;
    sMatricula   := trim(QryHstContrib.fieldByname('Matricula').asString);
    sIdPLanoPrev := trim(QryHstContrib.fieldByname('IDPLANOPREV').asString);

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Text := 'SELECT * FROM ('+ sSQL +') WHERE MATRICULA ='+ QuotedStr(sMatricula)+' AND IDPLANOPREV = ' + sIdPlanoPrev;
    QryAux.Open;

    QryAux.First;

    while Not QryAux.Eof Do begin
       for i:=0 to lstCampos.count -1 do begin
        if (Pos(QryAux.FieldByname('MATRICULA').asString,lstCampos[i])>0) and (Pos(QryAux.FieldByname('IDPLANOPREV').asString,lstCampos[i])>0)  then begin
          lstCampos.Delete(i);
          break;
        end;
      end;
     QryAux.Next;
    end;

    QryHstContrib.Close;
    QryHstContrib.SQL.Clear;
    QryHstContrib.SQL.Text := 'SELECT * FROM ('+ sSQL +') WHERE MATRICULA <>'+ QuotedStr(sMatricula);
    QryHstContrib.Open;

    btnExcluir.Enabled    := not QryHstContrib.IsEmpty;
    btnLimpar.Enabled     := not QryHstContrib.IsEmpty;
    bbtnConfirmar.Enabled := not QryHstContrib.IsEmpty;
    btnArquivo.Enabled    := not QryHstContrib.IsEmpty;
  end;

end;

procedure TFrmAltPercContribLote.QryHstContribAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  if QryHstContrib.Active then begin
    btnExcluir.Enabled := not QryHstContrib.IsEmpty;
    btnLimpar.Enabled  := not QryHstContrib.IsEmpty;
  end;


end;

procedure TFrmAltPercContribLote.btnLimparClick(Sender: TObject);
begin
  inherited;

   QryHstContrib.Close;
   QryHstContrib.SQL.Clear;

   lstCampos.Clear;
   btnExcluir.Enabled    := False;
   btnLimpar.Enabled     := False;
   bbtnConfirmar.Enabled := False;
   btnArquivo.Enabled    := False;
end;

procedure TFrmAltPercContribLote.ppLabel14Print(Sender: TObject);
begin
  inherited;
  QryRelatorio_aux.close;
  QryRelatorio_aux.parambyname('pSeqproposta').value := QryRelatorio.fieldbyname('Seqproposta_max').value;
  QryRelatorio_aux.open;

  if not QryRelatorio_aux.isempty then
     ppLabel14.Caption := QryRelatorio_aux.fieldbyname('Percentual_ant').asstring
  else
     ppLabel14.Caption := QryRelatorio.fieldbyname('Percentual').asstring;
end;

end.
