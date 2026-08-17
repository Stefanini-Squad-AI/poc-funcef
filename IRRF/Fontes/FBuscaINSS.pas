unit FBuscaINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, ComCtrls,
  Db, DBTables, Wwquery, wwdblook, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid;


type
  TfrmBuscaINSS = class(TfrmSairAjuda)
    pnlOpcoes: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    ProgressBar1: TProgressBar;
    memResult: TMemo;
    bbtnProcessaGeracao: TBitBtn;
    dblcNatRendimento: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    dblcInforme: TwwDBLookupCombo;
    qryInforme: TwwQuery;
    qryNatur: TwwQuery;
    qryLancamento: TwwQuery;
    qryInsLancIRRF: TwwQuery;
    dbgINSS: TwwDBGrid;
    dsLancamento: TwwDataSource;
    qryInsLancxInforme: TwwQuery;
    bbtnBuscaDados: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnProcessaGeracaoClick(Sender: TObject);
    procedure bbtnBuscaDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MontaAbreQuery;
    function InsereLancamento: boolean;
  end;

implementation

uses uMensErro, uSistema, uDataBase, DBaseDados;

{$R *.DFM}

procedure TfrmBuscaINSS.FormCreate(Sender: TObject);
begin
  inherited;
  dtInicio.Text := '01/01/2005';
  dtFim.Text    := '31/12/2005';

  qryNatur.open;
  qryInforme.open;
end;

procedure TfrmBuscaINSS.FormShow(Sender: TObject);
begin
   inherited;
   dtInicio.SetFocus;
end;

procedure TfrmBuscaINSS.bbtnProcessaGeracaoClick(Sender: TObject);
begin
  inherited;
  memResult.visible:=true;
  dtmBaseDados.dbBaseDados.StartTransaction;
  try
    qryLancamento.first;
    while not qryLancamento.eof do
    begin
      progressbar1.position:=progressbar1.position+1;
      if InsereLancamento then
      begin
        dtmBaseDados.dbBaseDados.Commit;
        dtmBaseDados.dbBaseDados.StartTransaction;
      end
      else
      begin
        dtmBaseDados.dbBaseDados.rollback;
        dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      qryLancamento.next;
    end;
  finally
    MsgDlg('Operação efetuada concluída!','Aviso',mtWarning,[mbOK],0);
    dtmBaseDados.dbBaseDados.Commit;
    bbtnprocessageracao.enabled := false;
    bbtnBuscaDados.enabled := true;
    pnlOpcoes.enabled := true;
  end;
end;

function TfrmBuscaINSS.InsereLancamento: boolean;
var idlancirrf: integer;
begin
  result:=false;
  idlancirrf:=LeUltRegistro(nil,'LANCIRRF');
  qryInsLancIRRF.close;
  qryInsLancIRRF.parambyname('pIDLANCIRRF').asfloat        := idlancirrf;
  qryInsLancIRRF.parambyname('pIDBENEFIRRF').asfloat       := qryLancamento.fieldbyname('IDFORCLI').asfloat;
  qryInsLancIRRF.parambyname('pDATALANCAMENTO').asdatetime := qryLancamento.fieldbyname('DATALANCTO').asdatetime;
  qryInsLancIRRF.parambyname('pCODDOCUMENTO').asfloat      := qryLancamento.fieldbyname('CODDOCUMENTO').asfloat;
  qryInsLancIRRF.parambyname('pIDPESSOA').asfloat          := qryLancamento.fieldbyname('IDPESSOA').asfloat;
  qryInsLancIRRF.parambyname('pVLRBASE').asfloat           := qryLancamento.fieldbyname('VALBASE').asfloat;
  qryInsLancIRRF.parambyname('pCODNATUREZA').asstring      := qryNatur.fieldbyname('CODNATUREZA').asstring;
  qryInsLancIRRF.parambyname('pVLRINSS').asfloat           := qryLancamento.fieldbyname('VALOR').asfloat;
  try
    qryInsLancIRRF.execsql;
  except
    memResult.lines.add('Erro ao inserir LancIRRF. Documento: '+qryLancamento.fieldbyname('CODDOCUMENTO').asstring);
    exit;
  end;
  qryInsLancxInforme.close;
  qryInsLancxInforme.parambyname('pIDLANCIRRF').asfloat := idlancirrf;
  qryInsLancxInforme.parambyname('pIDINFORME').asfloat  := qryInforme.fieldbyname('IDINFORME').asfloat;
  qryInsLancxInforme.parambyname('pVLRLANC').asfloat    := qryLancamento.fieldbyname('VALOR').asfloat;
  try
    qryInsLancxInforme.execsql;
  except
    memResult.lines.add('Erro ao inserir LancxInforme. Documento: '+qryLancamento.fieldbyname('CODDOCUMENTO').asstring);
    exit;
  end;
  result:=true;
end;

procedure TfrmBuscaINSS.MontaAbreQuery;
begin
  qryLancamento.close;
  qryLancamento.sql.clear;
  qryLancamento.sql.add(
    'SELECT L.CODDOCUMENTO, D.IDFORCLI, L.CODALTERADOR, LB.DATALANCTO, P.NOME, '+#13#10+
    '       LBBASE.VALOR AS VALBASE , D.IDPESSOA, SUM(L.VALOR) AS VALOR '+#13#10+
    'FROM LANCTODOCUM L, ALTXIMPOSTO A, DOCUMENTO D, PESSOA P, '+#13#10+
    '     (SELECT LB.CODDOCUMENTO, LB.DATALANCTO , LB.VALOR '+#13#10+
    '      FROM LANCTODOCUM LB '+#13#10+
    '      WHERE (LB.OPERACAO = 5) '+#13#10+
    '      AND (LB.DATALANCTO BETWEEN TO_DATE('+quotedstr(dtInicio.text)+',''DD/MM/YYYY'') AND TO_DATE('+quotedstr(dtFim.text)+',''DD/MM/YYYY'') ) ) LB, '+#13#10+
    '     (SELECT LBBASE.CODDOCUMENTO, LBBASE.VALOR '+#13#10+
    '      FROM LANCTODOCUM LBBASE '+#13#10+
    '      WHERE (LBBASE.OPERACAO = 2) ) LBBASE '+#13#10+
    'WHERE (L.CODALTERADOR = A.CODALTERADOR) '+#13#10+
    'AND (A.CODIMPOSTO = 2) '+#13#10+
    'AND (L.CODDOCUMENTO = LB.CODDOCUMENTO) '+#13#10+
    'AND (L.CODDOCUMENTO = LBBASE.CODDOCUMENTO) '+#13#10+
    'AND (L.CODDOCUMENTO = D.CODDOCUMENTO) '+#13#10+
    'AND (P.IDPESSOA = D.IDFORCLI) '+#13#10+
    'AND (L.CODDOCUMENTO NOT IN ( '+#13#10+
    '     SELECT L1.CODDOCUMENTO '+#13#10+
    '     FROM LANCTODOCUM L1, ALTXIMPOSTO A1, '+#13#10+
    '          (SELECT LB1.CODDOCUMENTO, LB1.DATALANCTO '+#13#10+
    '           FROM LANCTODOCUM LB1 '+#13#10+
    '           WHERE (LB1.OPERACAO = 5) '+#13#10+
    '           AND (LB1.DATALANCTO BETWEEN TO_DATE('+quotedstr(dtInicio.text)+',''DD/MM/YYYY'') AND TO_DATE('+quotedstr(dtFim.text)+',''DD/MM/YYYY'') ) ) LB1 '+#13#10+
    '     WHERE (L1.CODALTERADOR = A1.CODALTERADOR) '+#13#10+
    '     AND (A1.CODIMPOSTO = 1) '+#13#10+
    '     AND L1.CODDOCUMENTO = LB1.CODDOCUMENTO)) '+#13#10+
    'AND NOT EXISTS ( '+#13#10+
    '  SELECT 1 '+#13#10+
    '  FROM LANCIRRF LI '+#13#10+
    '  WHERE LI.CODDOCUMENTO = L.CODDOCUMENTO '+#13#10+
    '  AND (LI.DATALANCAMENTO BETWEEN TO_DATE('+quotedstr(dtInicio.text)+',''DD/MM/YYYY'') AND TO_DATE('+quotedstr(dtFim.text)+',''DD/MM/YYYY'')) '+#13#10+
    '  AND LI.IDBENEFIRRF = D.IDFORCLI '+#13#10+
    '  ) '+#13#10+
    'GROUP BY L.CODDOCUMENTO, D.IDFORCLI, L.CODALTERADOR, LB.DATALANCTO, P.NOME, '+#13#10+
    '         LBBASE.VALOR, D.IDPESSOA '+#13#10+
    'ORDER BY L.CODDOCUMENTO '+#13#10
  );
  qryLancamento.open;
end;

procedure TfrmBuscaINSS.bbtnBuscaDadosClick(Sender: TObject);
begin
  inherited;
  if dtFim.Date < dtInicio.date then
  Begin
     MsgDlg('Data final não pode ser menor que a inicial.','Aviso',mtWarning,[mbOK],0);
     dtFim.date := dtInicio.date;
     exit;
  end
  else
  if dtFim.Date > Date then
  Begin
     MsgDlg('Data final não pode ser maior que a corrente.','Aviso',mtWarning,[mbOK],0);
     exit;
  end;

  if trim(dblcNatRendimento.text) = '' then
  Begin
     MsgDlg('Deve-se selecionar a natureza de rendimento.','Aviso',mtWarning,[mbOK],0);
     exit;
  end;

  if trim(dblcInforme.text) = '' then
  Begin
     MsgDlg('Deve-se selecionar a linha de informe.','Aviso',mtWarning,[mbOK],0);
     exit;
  end;

  MontaAbreQuery;
  progressbar1.position:=0;
  progressbar1.min:=0;
  progressbar1.max:=qryLancamento.recordcount;
  bbtnprocessageracao.enabled := not qryLancamento.isempty;
  bbtnBuscaDados.enabled := qryLancamento.isempty;
  pnlOpcoes.enabled := qryLancamento.isempty;
end;

end.
