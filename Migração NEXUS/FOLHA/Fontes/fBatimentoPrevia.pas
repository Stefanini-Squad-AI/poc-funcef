unit fBatimentoPrevia;

// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Everson Luiz Pereira da Cunha
// Data        : 20/02/2018
// Pendência   : SIG TIBERO
// Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//               Retirada de INDEX, +rule etc.
//               Melhoria realizada para adaptação ao TIBERO.
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, Db, DBTables, Wwquery, Buttons, ExtCtrls, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, udatabase, CheckLst, ufuncoesfolha,
  uObjFolha, dbasedados, DBGrids, DBCtrls, FTelaAut, IvDictio, IvMulti,
  UMensErro, IvEMulti, FOkCancelar, MAHlpBtn, TB97Tlbr, TB97, ppDB,
  ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppDBPipe, ppComm, ppRelatv,
  ppProd, ppReport;

type
  TfrmBatimentoPrevia = class(TfrmOkCancelar)
    qryOrigem: TwwQuery;
    opdir: TOpenDialog;
    dsItem1: TwwDataSource;
    qryItem1: TwwQuery;
    qryItem2: TwwQuery;
    dsItem2: TwwDataSource;
    qryItem3: TwwQuery;
    dsItem3: TwwDataSource;
    qryRubricas: TwwQuery;
    qryAux: TwwQuery;
    qryBateRubrica: TwwQuery;
    qryRubPrevia: TwwQuery;
    qryRubTab: TwwQuery;
    dsAssoc: TwwDataSource;
    qryAssoc: TwwQuery;
    qryAssocRUBCM: TStringField;
    qryAssocDESCRICAO: TStringField;
    qryAssocRUBLEG: TStringField;
    qryAssocDESCRICAO_1: TStringField;
    dsEscolheRub: TwwDataSource;
    qryEscolheRub: TwwQuery;
    updAssoc: TUpdateSQL;
    dsBatimento: TwwDataSource;
    qryBatimento: TwwQuery;
    qryBatimentoLista: TwwQuery;
    dsRubCM: TwwDataSource;
    dsRubLeg: TwwDataSource;
    qryRubLeg: TwwQuery;
    qryRubCM: TwwQuery;
    PageControl1: TPageControl;
    tbsopcao: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblArquivo: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    lblObsBatimento: TLabel;
    spbtnArqBatimento: TSpeedButton;
    Label11: TLabel;
    rgOpcao: TRadioGroup;
    pnlLblDiretorio: TPanel;
    lblarq1: TLabel;
    Panel1: TPanel;
    lblarq2: TLabel;
    Panel2: TPanel;
    lblarq3: TLabel;
    Panel3: TPanel;
    lblarq4: TLabel;
    chkItem1: TCheckBox;
    chkItem2: TCheckBox;
    chkItem3: TCheckBox;
    chkItem4: TCheckBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label8: TLabel;
    cboxConsig: TCheckBox;
    edTabela: TEdit;
    eddif: TEdit;
    pnlArqBatimento: TPanel;
    lblarq5: TLabel;
    chkItem5: TCheckBox;
    chklstOrigem: TCheckListBox;
    btnMontaRubrica: TButton;
    cboxEliminaTabelaBatimento: TCheckBox;
    pnlResultado: TPanel;
    lblResultado: TLabel;
    tbsItem1: TTabSheet;
    pnlTitulo1: TPanel;
    dbgItem1: TwwDBGrid;
    tbsItem2: TTabSheet;
    Panel4: TPanel;
    dbgItem2: TwwDBGrid;
    tbsItem3: TTabSheet;
    Panel5: TPanel;
    dbgItem3: TwwDBGrid;
    tbsItem4: TTabSheet;
    Panel6: TPanel;
    pnlResultado4: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    tbsBateRubrica: TTabSheet;
    lblListaRubricas: TLabel;
    cboxRubricas: TCheckBox;
    chklstRubricas: TCheckListBox;
    tbsRelacaoRubricas: TTabSheet;
    dbgAssocRub: TwwDBGrid;
    dblcEscolheRub: TwwDBLookupCombo;
    tbsAnaliseBatimento: TTabSheet;
    pnlOpcao: TPanel;
    rgOpcaoBatimento: TRadioGroup;
    rgOpcaoRub: TRadioGroup;
    PageControl2: TPageControl;
    tbsOcorrencias: TTabSheet;
    dbgBatimento: TwwDBGrid;
    tbsRubricas: TTabSheet;
    Splitter1: TSplitter;
    Label18: TLabel;
    Label20: TLabel;
    dbgRubLeg: TwwDBGrid;
    dbgRubCM: TwwDBGrid;
    pnlInfo: TPanel;
    lblLote: TLabel;
    lblMattit: TLabel;
    lblnomedep: TLabel;
    lblMatdep: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    lblProvCM: TLabel;
    lblProvLeg: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    lblDescCM: TLabel;
    lblDescLeg: TLabel;
    Label13: TLabel;
    lblLiqCM: TLabel;
    Label16: TLabel;
    lblLiqLeg: TLabel;
    Label17: TLabel;
    lbldifprov: TLabel;
    Label19: TLabel;
    lbldifdesc: TLabel;
    Label21: TLabel;
    lbldifliq: TLabel;
    Label22: TLabel;
    Panel9: TPanel;
    bbtnAtualizaAssociacao: TBitBtn;
    bbtnConfirmaAlteracoes: TBitBtn;
    pprRelat: TppReport;
    ppRelat: TppDBPipeline;
    qryRelat: TwwQuery;
    dsRelat: TwwDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppDBText11: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine3: TppLine;
    ppLine4: TppLine;
    updBatimento: TUpdateSQL;
    Panel10: TPanel;
    btnGeraLista: TButton;
    btnImprimir: TButton;
    btnAplica: TButton;
    rgDivergencia: TRadioGroup;
    dsBatimentoLista: TwwDataSource;
    tbsDistribuicaoRubricas: TTabSheet;
    dbgFiltro: TwwDBGrid;
    lblFiltro: TLabel;
    dbnPagamentos: TDBNavigator;
    lblQuantidade: TLabel;
    rgOrigem: TRadioGroup;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkItem3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboxRubricasClick(Sender: TObject);
    procedure spbtnArqBatimentoClick(Sender: TObject);
    procedure btnMontaRubricaClick(Sender: TObject);
    procedure bbtnAtualizaAssociacaoClick(Sender: TObject);
    procedure bbtnConfirmaAlteracoesClick(Sender: TObject);
    procedure qryAssocBeforeScroll(DataSet: TDataSet);
    procedure rgOpcaoBatimentoClick(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure rgOpcaoRubClick(Sender: TObject);
    procedure btnGeraListaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgOpcaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAplicaClick(Sender: TObject);
    procedure dbgBatimentoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure qryBatimentoListaAfterScroll(DataSet: TDataSet);
    procedure qryBatimentoAfterScroll(DataSet: TDataSet);
    procedure rgOrigemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bMudou: boolean;
    function PegaLotes: string;
  public
    { Public declarations }
    ListaRubricas: tstringlist;
    ListaOrigem: tstringlist;
    procedure AbreArquivo(lbl: tlabel);
    procedure PreparaQryBatimento;
    procedure AbreQryBatimento;
    procedure EliminaBatimento(scodprovdesc: string);
    procedure AbreOrigem(aiOrigem: integer);
  end;

var
  frmBatimentoPrevia: TfrmBatimentoPrevia;

implementation

{$R *.DFM}

procedure TfrmBatimentoPrevia.AbreArquivo(lbl: tlabel);
begin
  opdir.InitialDir:=lbl.caption;
  if opdir.execute then
  begin
    lbl.caption:=opdir.filename;
    lbl.update;
  end;
end;

procedure TfrmBatimentoPrevia.SpeedButton1Click(Sender: TObject);
begin
  AbreArquivo(lblarq1);
end;

procedure TfrmBatimentoPrevia.SpeedButton2Click(Sender: TObject);
begin
  AbreArquivo(lblarq2);
end;

procedure TfrmBatimentoPrevia.SpeedButton3Click(Sender: TObject);
begin
  AbreArquivo(lblarq3);
end;

procedure TfrmBatimentoPrevia.SpeedButton4Click(Sender: TObject);
begin
  AbreArquivo(lblarq4);
end;

procedure TfrmBatimentoPrevia.spbtnArqBatimentoClick(Sender: TObject);
begin
  AbreArquivo(lblarq5);
end;

procedure TfrmBatimentoPrevia.FormShow(Sender: TObject);
begin
  WindowState:=wsMaximized;
  qryAssoc.open;
  qryEscolheRub.open;
  ListaRubricas:=tstringlist.create;
  ListaOrigem:=tstringlist.create;
  AbreOrigem(0);
  rgOpcaoBatimentoClick(Sender);
  tbsAnaliseBatimento.tabvisible:=false;
  tbsBateRubrica.tabvisible:=false;
  PageControl1.activepage:=tbsopcao;
  PageControl2.activepage:=tbsDistribuicaoRubricas;
end;

procedure TfrmBatimentoPrevia.bbtnConfirmarClick(Sender: TObject);
var ssql: string;
    ffile: textfile;
    iproc, ilinha, i: integer;
    rdif: real;

  procedure BateRubrica(sdescricao, srubrica: string);
  begin
    lblResultado.caption:='Processando fase 5. '+
                          'Análise individual das rubricas. '+
                          'Rubrica: '+sdescricao;
    lblResultado.update;
    writeln(ffile,'Batimento da rubrica:'+sdescricao+#9);
    if rgOrigem.itemindex = 0 then
      ssql:='SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.IDTITULAR, G.IDRESPONSAVEL, G.CODPROVDESC '+
            'FROM (SELECT V.IDTITULAR, V.IDRESPONSAVEL, P.CODPROVDESC '+
                  'FROM PREVIA V, PROVDESC P '+
                  'WHERE V.IDLOTE '+PegaLotes+' '+
                  'AND V.IDRUBRICA = P.IDPROVENTO '+
                  'AND V.IDRUBRICA = '+srubrica
    else
      ssql:='SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.IDTITULAR, G.IDRESPONSAVEL, G.CODPROVDESC '+
            'FROM (SELECT V.IDTITULAR, V.IDRESPONSAVEL, P.CODPROVDESC '+
                  'FROM HISTRUBSAL V, PROVDESC P '+
                  'WHERE V.IDHSTFOLHABENEF '+PegaLotes+' '+
                  'AND V.FLGESTORNO = 0 '+
                  'AND V.IDRUBRICA = P.IDPROVENTO '+
                  'AND V.IDRUBRICA = '+srubrica;

    if cboxConsig.Checked then
      ssql:=ssql+'AND V.FLGPENSAOALIM IN (0,1) ';
    ssql:=ssql+ 'MINUS '+
                'SELECT T.IDTITULAR, T.IDRESPONSAVEL, P.CODPROVDESC '+
                'FROM '+edTabela.text+' T, PROVDESC P '+
                'WHERE T.IDRUBRICA = P.IDPROVENTO '+
                'AND T.IDRUBRICA = '+srubrica+' '+
                ') G, ELEGPATRO E, DEPENTIT DP, PESSOA P '+
          'WHERE E.IDPESSOA = G.IDTITULAR '+
          'AND DP.IDTITULAR(+) = G.IDTITULAR '+
          'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL '+
          'AND P.IDPESSOA = G.IDRESPONSAVEL '+
          'ORDER BY E.MATRICULA, MATDEP ';
    if FazQuery(qryBateRubrica,ssql) then
    begin
      writeln(ffile,'Existe na Previa e nao existe no legado');
      writeln(ffile,'MATR TITULAR'+#9+'MATR DEP.'+#9+'NOME'+#9+'IDTITULAR'+#9+
                    'IDRESPONSAVEL'+#9+'RUBRICA');
      qryBateRubrica.first;
      while not qryBateRubrica.eof do
      begin
        writeln(ffile,qryBateRubrica.fields[0].asstring+#9+
                      qryBateRubrica.fields[1].asstring+#9+
                      qryBateRubrica.fields[2].asstring+#9+
                      qryBateRubrica.fields[3].asstring+#9+
                      qryBateRubrica.fields[4].asstring+#9+
                      qryBateRubrica.fields[5].asstring);
        qryBateRubrica.next;
      end;
    end;

    if rgOrigem.itemindex = 0 then
      ssql:='SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.IDTITULAR, G.IDRESPONSAVEL, G.CODPROVDESC '+
            'FROM ('+
                  'SELECT T.IDTITULAR, T.IDRESPONSAVEL, P.CODPROVDESC '+
                  'FROM '+edTabela.text+' T, PROVDESC P '+
                  'WHERE T.IDRUBRICA = P.IDPROVENTO '+
                  'AND T.IDRUBRICA = '+srubrica+' '+
                  'MINUS '+
                  'SELECT V.IDTITULAR, V.IDRESPONSAVEL, P.CODPROVDESC '+
                  'FROM PREVIA V, PROVDESC P '+
                  'WHERE V.IDLOTE '+PegaLotes+' '+
                  'AND V.IDRUBRICA = P.IDPROVENTO '+
                  'AND V.IDRUBRICA = '+srubrica
    else
      ssql:='SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.IDTITULAR, G.IDRESPONSAVEL, G.CODPROVDESC '+
            'FROM ('+
                  'SELECT T.IDTITULAR, T.IDRESPONSAVEL, P.CODPROVDESC '+
                  'FROM '+edTabela.text+' T, PROVDESC P '+
                  'WHERE T.IDRUBRICA = P.IDPROVENTO '+
                  'AND T.IDRUBRICA = '+srubrica+' '+
                  'MINUS '+
                  'SELECT V.IDTITULAR, V.IDRESPONSAVEL, P.CODPROVDESC '+
                  'FROM HISTRUBSAL V, PROVDESC P '+
                  'WHERE V.IDHSTFOLHABENEF '+PegaLotes+' '+
                  'AND V.FLGESTORNO = 0 '+
                  'AND V.IDRUBRICA = P.IDPROVENTO '+
                  'AND V.IDRUBRICA = '+srubrica;

    if cboxConsig.Checked then
      ssql:=ssql+'AND V.FLGPENSAOALIM IN (0,1) ';
    ssql:=ssql+ ') G, ELEGPATRO E, DEPENTIT DP, PESSOA P '+
          'WHERE E.IDPESSOA = G.IDTITULAR '+
          'AND DP.IDTITULAR(+) = G.IDTITULAR '+
          'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL '+
          'AND P.IDPESSOA = G.IDRESPONSAVEL '+
          'ORDER BY E.MATRICULA, MATDEP ';
    if FazQuery(qryBateRubrica,ssql) then
    begin
      writeln(ffile,'Nao existe na Previa e existe no legado'+#9);
      writeln(ffile,'MATR TITULAR'+#9+'MATR DEP.'+#9+'NOME'+#9+'IDTITULAR'+#9+
                    'IDRESPONSAVEL'+#9+'RUBRICA');
      qryBateRubrica.first;
      while not qryBateRubrica.eof do
      begin
        writeln(ffile,qryBateRubrica.fields[0].asstring+#9+
                      qryBateRubrica.fields[1].asstring+#9+
                      qryBateRubrica.fields[2].asstring+#9+
                      qryBateRubrica.fields[3].asstring+#9+
                      qryBateRubrica.fields[4].asstring+#9+
                      qryBateRubrica.fields[5].asstring);
        qryBateRubrica.next;
      end;
    end;

    if rgOrigem.itemindex = 0 then
      ssql:='SELECT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, '+
                   'V.IDTITULAR, V.IDRESPONSAVEL, PD.CODPROVDESC, '+
                   'V.VALORPROVENTO, T.VALORPROVENTO '+
            'FROM PREVIA V, '+edTabela.text+' T, PROVDESC PD, '+
                 'ELEGPATRO E, DEPENTIT DP, PESSOA P '+
            'WHERE V.IDLOTE '+PegaLotes+' '
    else
      ssql:='SELECT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, '+
                   'V.IDTITULAR, V.IDRESPONSAVEL, PD.CODPROVDESC, '+
                   'V.VALORPROVENTO, T.VALORPROVENTO '+
            'FROM HISTRUBSAL V, '+edTabela.text+' T, PROVDESC PD, '+
                 'ELEGPATRO E, DEPENTIT DP, PESSOA P '+
            'WHERE V.IDHSTFOLHABENEF '+PegaLotes+' '+
            'AND V.FLGESTORNO = 0 ';

    if cboxConsig.Checked then
      ssql:=ssql+'AND V.FLGPENSAOALIM IN (0,1) ';
    ssql:=ssql+
          'AND V.IDTITULAR = T.IDTITULAR '+
          'AND V.IDRESPONSAVEL = T.IDRESPONSAVEL '+
          'AND V.IDRUBRICA = T.IDRUBRICA '+
          'AND ABS(V.VALORPROVENTO - T.VALORPROVENTO) > 0.01 '+
          'AND V.IDRUBRICA = PD.IDPROVENTO '+
          'AND V.IDRUBRICA = '+srubrica+' '+
          'AND E.IDPESSOA = V.IDTITULAR '+
          'AND DP.IDTITULAR(+) = V.IDTITULAR '+
          'AND DP.IDPESSOA(+) = V.IDRESPONSAVEL '+
          'AND P.IDPESSOA = V.IDRESPONSAVEL '+
          'ORDER BY E.MATRICULA, MATDEP ';
    if FazQuery(qryBateRubrica,ssql) then
    begin
      writeln(ffile,'Valores divergentes entre a Prévia e o legado'+#9);
      writeln(ffile,'MATR TITULAR'+#9+'MATR DEP.'+#9+'NOME'+#9+'IDTITULAR'+#9+
                    'IDRESPONSAVEL'+#9+'RUBRICA'+#9+'VALOR PREVIA'+#9+'VALOR LEGADO');
      qryBateRubrica.first;
      while not qryBateRubrica.eof do
      begin
        writeln(ffile,qryBateRubrica.fields[0].asstring+#9+
                      qryBateRubrica.fields[1].asstring+#9+
                      qryBateRubrica.fields[2].asstring+#9+
                      qryBateRubrica.fields[3].asstring+#9+
                      qryBateRubrica.fields[4].asstring+#9+
                      qryBateRubrica.fields[5].asstring+#9+
                      qryBateRubrica.fields[6].asstring+#9+
                      qryBateRubrica.fields[7].asstring);
        qryBateRubrica.next;
      end;
    end;
  end;

  procedure BateRubrica1(sdescricao, srubrica: string);
  var idt1, idt2, idr1, idr2: integer;
      cod1, cod2, rub1, rub2: string;
      val1, val2: real;
      mattit1, matdep1, nome1,
      mattit2, matdep2, nome2: string;
      icompara: integer;

    procedure PegaValoresPrevia(bnext: boolean);
    begin
      if bnext then
        qryRubPrevia.next;
      if not qryRubPrevia.eof then
      begin
        idt1:=qryRubPrevia.fieldbyname('IDTITULAR').asinteger;
        idr1:=qryRubPrevia.fieldbyname('IDRESPONSAVEL').asinteger;
        cod1:=qryRubPrevia.fieldbyname('CODPROVDESC').asstring;
        rub1:=qryRubPrevia.fieldbyname('DESCRICAO').asstring;
        val1:=qryRubPrevia.fieldbyname('VALORPROVENTO').asfloat;
        mattit1:=qryRubPrevia.fieldbyname('MATRICULA').asstring;
        matdep1:=qryRubPrevia.fieldbyname('MATDEP').asstring;
        nome1:=qryRubPrevia.fieldbyname('NOME').asstring;
      end
      else
      begin
        idt1:=maxint;
        idr1:=maxint;
        cod1:=#255;
        rub1:=#255;
        val1:=9999999999;
        mattit1:=#255;
        matdep1:=#255;
        nome1:=#255;
      end;
    end;

    procedure PegaValoresTab(bnext: boolean);
    begin
      if bnext then
        qryRubTab.next;
      if not qryRubTab.eof then
      begin
        idt2:=qryRubTab.fieldbyname('IDTITULAR').asinteger;
        idr2:=qryRubTab.fieldbyname('IDRESPONSAVEL').asinteger;
        cod2:=qryRubTab.fieldbyname('CODPROVDESC').asstring;
        rub2:=qryRubTab.fieldbyname('DESCRICAO').asstring;
        val2:=qryRubTab.fieldbyname('VALORPROVENTO').asfloat;
        mattit2:=qryRubTab.fieldbyname('MATRICULA').asstring;
        matdep2:=qryRubTab.fieldbyname('MATDEP').asstring;
        nome2:=qryRubTab.fieldbyname('NOME').asstring;
      end
      else
      begin
        idt2:=maxint;
        idr2:=maxint;
        cod2:=#255;
        rub2:=#255;
        val2:=9999999999;
        mattit2:=#255;
        matdep2:=#255;
        nome2:=#255;
      end;
    end;

    function ComparaValores: integer;
    begin
      result:=0;

      if idt1 < idt2 then
      begin
        result:=1;
        exit;
      end
      else
        if idt1 > idt2 then
        begin
          result:=2;
          exit;
        end;

      if idr1 < idr2 then
      begin
        result:=1;
        exit;
      end
      else
        if idr1 > idr2 then
        begin
          result:=2;
          exit;
        end;

      if cod1 < cod2 then
      begin
        result:=1;
        exit;
      end
      else
        if cod1 > cod2 then
        begin
          result:=2;
          exit;
        end;
    end;

    procedure Escreve(i: integer);
    var b: boolean;
    begin
      b:=true;
      if i = 0 then
      begin
        if abs(val1-val2) > rdif then
          writeln(ffile,inttostr(i)+#9+
                  mattit1+#9+matdep1+#9+nome1+#9+cod1+#9+rub1+#9+formatfloat('#0.00',val1)+#9+
                  formatfloat('#0.00',val2)+#9+inttostr(idt1)+#9+inttostr(idr1))
        else
          b:=false;
      end
      else
      if i = 1 then
        writeln(ffile,inttostr(i)+#9+
                mattit1+#9+matdep1+#9+nome1+#9+cod1+#9+rub1+#9+formatfloat('#0.00',val1)+#9+
                #9+inttostr(idt1)+#9+inttostr(idr1))
      else
      if i = 2 then
        writeln(ffile,inttostr(i)+#9+
                mattit2+#9+matdep2+#9+nome2+#9+cod2+#9+rub2+#9+#9+formatfloat('#0.00',val2)+
                #9+inttostr(idt2)+#9+inttostr(idr2));
      if b then
        inc(ilinha);
      inc(iproc);
      lblResultado.caption:='Processando fase 5. '+
        'Análise individual das rubricas. '+
        'Rubrica: '+sdescricao+
        ' | Proc: '+inttostr(iproc)+' | Linha: '+inttostr(ilinha);
      lblResultado.update;
    end;

    procedure GravaTabela(i: integer);
    var b: boolean;
    begin
      b:=true;
      if i = 0 then
      begin
        if abs(val1-val2) > rdif then
          ExecutarQuery(qryAux, 'INSERT INTO BATIMENTOFOLHA (IDTITULAR, '+
            'IDPESSOA, IDRUBRICA, CODPROVDESC, VALORCM, VALORLEG, MATTIT, MATDEP) '+
            'VALUES ('+inttostr(idt1)+','+
                       inttostr(idr1)+','+
                       'NULL,'+
                       quotedstr(cod1)+','+
                       SistemaFolha.oranumero(formatfloat('#0.00',val1))+','+
                       SistemaFolha.oranumero(formatfloat('#0.00',val2))+','+
                       quotedstr(mattit1)+','+
                       quotedstr(matdep1)+')')
        else
          b:=false;
      end
      else
      if i = 1 then
        ExecutarQuery(qryAux, 'INSERT INTO BATIMENTOFOLHA (IDTITULAR, '+
          'IDPESSOA, IDRUBRICA, CODPROVDESC, VALORCM, VALORLEG, MATTIT, MATDEP) '+
          'VALUES ('+inttostr(idt1)+','+
                     inttostr(idr1)+','+
                     'NULL,'+
                     quotedstr(cod1)+','+
                     SistemaFolha.oranumero(formatfloat('#0.00',val1))+','+
                     SistemaFolha.oranumero(formatfloat('#0.00',0))+','+
                     quotedstr(mattit1)+','+
                     quotedstr(matdep1)+')')
      else
      if i = 2 then
        ExecutarQuery(qryAux, 'INSERT INTO BATIMENTOFOLHA (IDTITULAR, '+
          'IDPESSOA, IDRUBRICA, CODPROVDESC, VALORCM, VALORLEG, MATTIT, MATDEP) '+
          'VALUES ('+inttostr(idt2)+','+
                     inttostr(idr2)+','+
                     'NULL,'+
                     quotedstr(cod2)+','+
                     SistemaFolha.oranumero(formatfloat('#0.00',0))+','+
                     SistemaFolha.oranumero(formatfloat('#0.00',val2))+','+
                     quotedstr(mattit2)+','+
                     quotedstr(matdep2)+')');
      if b then
        inc(ilinha);
      inc(iproc);
      lblResultado.caption:='Processando fase 5. '+
        'Análise individual das rubricas. '+
        'Rubrica: '+sdescricao+
        ' | Proc: '+inttostr(iproc)+' | Linha: '+inttostr(ilinha);
      lblResultado.update;
    end;

  begin
    application.processmessages;
    lblResultado.caption:='Processando fase 5. '+
                          'Análise individual das rubricas. '+
                          'Rubrica: '+sdescricao;
    lblResultado.update;
//    writeln(ffile,'Batimento da rubrica:'+sdescricao+#9);

    if rgOrigem.itemindex = 0 then
      ssql:='SELECT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, '+
                   'V.IDTITULAR, V.IDRESPONSAVEL, PD.CODPROVDESC, PD.DESCRICAO, '+
                   'ABS(SUM(DECODE(PD.FLGDESCONTO,2,V.VALORINFO,1,-V.VALORPROVENTO,V.VALORPROVENTO))) AS VALORPROVENTO '+
            'FROM PREVIA V, PROVDESC PD, '+
                 'ELEGPATRO E, DEPENTIT DP, PESSOA P '+
            'WHERE V.IDLOTE '+PegaLotes+' '
    else
      ssql:='SELECT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, '+
                   'V.IDTITULAR, V.IDRESPONSAVEL, PD.CODPROVDESC, PD.DESCRICAO, '+
                   'ABS(SUM(DECODE(PD.FLGDESCONTO,2,V.VALORINFO,1,-V.VALORPROVENTO,V.VALORPROVENTO))) AS VALORPROVENTO '+
            'FROM HISTRUBSAL V, PROVDESC PD, '+
                 'ELEGPATRO E, DEPENTIT DP, PESSOA P '+
            'WHERE V.IDHSTFOLHABENEF '+PegaLotes+' '+
            'AND V.FLGESTORNO = 0 ';

    if cboxConsig.Checked then
      ssql:=ssql+'AND V.FLGPENSAOALIM IN (0,1) ';
    ssql:=ssql+
          //'AND V.VALORPROVENTO > 0 '+
          'AND V.IDRUBRICA = PD.IDPROVENTO '+
          //'AND V.IDRUBRICA = '+srubrica+' '+
          'AND PD.CODPROVDESC = '+QuotedStr(srubrica)+' '+
          'AND E.IDPESSOA = V.IDTITULAR '+
          'AND E.IDPESSJUR = V.IDPATRO '+
          'AND DP.IDTITULAR(+) = V.IDTITULAR '+
          'AND DP.IDPESSOA(+) = V.IDRESPONSAVEL '+
          'AND P.IDPESSOA = V.IDRESPONSAVEL '+
          'GROUP BY E.MATRICULA, DP.MATRICULA, P.NOME, '+
                   'V.IDTITULAR, V.IDRESPONSAVEL, PD.CODPROVDESC, PD.DESCRICAO '+
          'ORDER BY V.IDTITULAR, V.IDRESPONSAVEL, VALORPROVENTO';
    FazQuery(qryRubPrevia,ssql);
    application.processmessages;

//    ssql:='SELECT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, '+
//                 'T.IDTITULAR, T.IDRESPONSAVEL, R.RUBCM AS CODPROVDESC, PD.DESCRICAO, '+
//                 'T.VALORPROVENTO '+
//          'FROM '+edTabela.text+' T, PROVDESC PD, RUBRICASCMXLEGADO R, '+
//               'ELEGPATRO E, DEPENTIT DP, PESSOA P '+
//          'WHERE R.RUBCM = '+QuotedStr(srubrica)+' '+
//          'AND PD.CODPROVDESC = R.RUBLEG '+
//          'AND T.IDRUBRICA = PD.IDPROVENTO '+
//          'AND E.IDPESSOA = T.IDTITULAR '+
//          'AND DP.IDTITULAR(+) = T.IDTITULAR '+
//          'AND DP.IDPESSOA(+) = T.IDRESPONSAVEL '+
//          'AND P.IDPESSOA = T.IDRESPONSAVEL '+
//          'ORDER BY T.IDTITULAR, T.IDRESPONSAVEL, T.VALORPROVENTO';
    ssql:='SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.IDTITULAR, '+
                 'G.IDRESPONSAVEL, G.CODPROVDESC, PD.DESCRICAO, '+
                 'ABS(SUM(DECODE(PD.FLGDESCONTO,1,-G.VALORPROVENTO,G.VALORPROVENTO))) AS VALORPROVENTO '+
                 //'SUM(G.VALORPROVENTO) AS VALORPROVENTO '+
          'FROM ( '+
          'SELECT T.IDTITULAR, T.IDRESPONSAVEL, '+
                 'R.RUBCM AS CODPROVDESC, T.VALORPROVENTO, T.IDPATRO '+
          'FROM '+edTabela.text+' T, PROVDESC PD, '+
               '(SELECT DISTINCT RUBCM, RUBLEG FROM RUBRICASCMXLEGADO) R '+
          'WHERE R.RUBCM = '+QuotedStr(srubrica)+' '+
          'AND PD.CODPROVDESC = R.RUBLEG '+
          'AND T.IDRUBRICA = PD.IDPROVENTO '+
          ') G, (SELECT DISTINCT CODPROVDESC, FLGDESCONTO, DESCRICAO FROM PROVDESC) PD, '+
               'ELEGPATRO E, DEPENTIT DP, PESSOA P '+
          'WHERE PD.CODPROVDESC = G.CODPROVDESC '+
          'AND E.IDPESSOA(+) = G.IDTITULAR '+
          'AND E.IDPESSJUR(+) = G.IDPATRO '+
          'AND DP.IDTITULAR(+) = G.IDTITULAR '+
          'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL '+
          'AND P.IDPESSOA = G.IDRESPONSAVEL '+
          'GROUP BY E.MATRICULA, DP.MATRICULA, P.NOME, G.IDTITULAR, '+
                   'G.IDRESPONSAVEL, G.CODPROVDESC, PD.DESCRICAO '+
          'ORDER BY G.IDTITULAR, G.IDRESPONSAVEL, VALORPROVENTO ';
    FazQuery(qryRubTab,ssql);
    application.processmessages;

    idt1:=-1; idt2:=-1; idr1:=-1; idr2:=-1;
    cod1:=''; cod2:=''; rub1:=''; rub2:='';
    val1:=-1; val2:=-1;

    if rgOpcao.itemindex = 0 then
    begin
      writeln(ffile,'Batimento a Previa TotalPrev e o Legado'+#9+#9+#9+#9+#9+#9+#9+#9);
      writeln(ffile,'Tipo(0-Diverge,1-Existe TotalPrev,2-Existe Legado)'+#9+
                    'Mat.Titular'+#9+
                    'Mat.Dep.'+#9+
                    'Nome Recebedor'+#9+
                    'Rubrica'+#9+
                    'Nome Rubrica'+#9+
                    'Valor Previa'+#9+
                    'Valor Legado'+#9+
                    'IdTitular'+#9+
                    'IdRecebedor');
    end;

    PegaValoresPrevia(false);
    PegaValoresTab(false);

    while not qryRubPrevia.eof or not qryRubTab.eof do
    begin
      iCompara:=ComparaValores;
      if rgOpcao.itemindex = 0 then
        Escreve(iCompara)
      else
        GravaTabela(iCompara);

      case iCompara of
      {igual} 0: begin
                   if not qryRubPrevia.eof then
                     PegaValoresPrevia(true);
                   if not qryRubTab.eof then
                     PegaValoresTab(true);
                 end;
      {Previa menor}
              1: begin
                   if not qryRubPrevia.eof then
                     PegaValoresPrevia(true);
                 end;
      {Tab Menor}
              2: begin
                   if not qryRubTab.eof then
                     PegaValoresTab(true);
                 end;
      end;
    end;
    application.processmessages;
  end;

begin
  rdif:=strtofloat(SistemaFolha.clientenumero(eddif.text));
  ilinha:=0; iproc:=0;
  //Processo 1
  if chkItem1.enabled and chkItem1.checked then
  begin
    lblResultado.caption:='Processando fase 1. Identificando Pessoas na Prévia não na Tabela';
    lblResultado.update;
    if rgOrigem.itemindex = 0 then
      ssql:='SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.IDTITULAR, G.IDRESPONSAVEL '+
//            'FROM (SELECT DISTINCT IDTITULAR, IDRESPONSAVEL '+    //Everson TIBERO
            'FROM (SELECT DISTINCT V.IDTITULAR, V.IDRESPONSAVEL '+  //Everson TIBERO
                  'FROM PREVIA V, PROVDESC PD '+
//                  'WHERE IDLOTE '+PegaLotes+' '+ //Everson TIBERO
                  'WHERE V.IDLOTE '+PegaLotes+' '+   //Everson TIBERO
                  'AND V.IDRUBRICA = PD.IDPROVENTO '+
                  'AND PD.FLGDESCONTO IN (0,1) '
    else
      ssql:='SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.IDTITULAR, G.IDRESPONSAVEL '+
//            'FROM (SELECT DISTINCT IDTITULAR, IDRESPONSAVEL '+   //Everson TIBERO
            'FROM (SELECT DISTINCT V.IDTITULAR, V.IDRESPONSAVEL '+ //Everson TIBERO
                  'FROM HISTRUBSAL V, PROVDESC PD '+
//                  'WHERE IDHSTFOLHABENEF '+PegaLotes+' '+ //Everson TIBERO
                  'WHERE V.IDHSTFOLHABENEF '+PegaLotes+' '+ //Everson TIBERO
                  'AND V.FLGESTORNO = 0 '+
                  'AND V.IDRUBRICA = PD.IDPROVENTO '+
                  'AND PD.FLGDESCONTO IN (0,1) ';

    if cboxConsig.Checked then
//      ssql:=ssql+'AND FLGPENSAOALIM IN (0,1) '; //Everson TIBERO
      ssql:=ssql+'AND V.FLGPENSAOALIM IN (0,1) '; //Everson TIBERO
    ssql:=ssql+ 'MINUS '+
//                'SELECT DISTINCT IDTITULAR, IDRESPONSAVEL '+   //Everson TIBERO
                'SELECT DISTINCT T.IDTITULAR, T.IDRESPONSAVEL '+ //Everson TIBERO
                'FROM '+edTabela.text+' T, PROVDESC PD '+
                'WHERE T.IDRUBRICA = PD.IDPROVENTO '+
                'AND PD.FLGDESCONTO IN (0,1) '+
                ') G, ELEGPATRO E, DEPENTIT DP, PESSOA P '+
          'WHERE E.IDPESSOA = G.IDTITULAR '+
          'AND DP.IDTITULAR(+) = G.IDTITULAR '+
          'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL '+
          'AND P.IDPESSOA = G.IDRESPONSAVEL '+
          'ORDER BY E.MATRICULA, MATDEP ';
    FazQuery(qryItem1,ssql);

    lblResultado.caption:='Salvando resultado da fase 1.';
    lblResultado.update;
    qryItem1.first;
    rewrite(ffile, lblarq1.caption);
    writeln(ffile,'MATR TITULAR'+#9+'MATR DEP.'+#9+'NOME'+#9+'IDTITULAR'+#9+'IDRESPONSAVEL');
    while not qryItem1.eof do
    begin
      writeln(ffile,qryItem1.fields[0].asstring+#9+
                    qryItem1.fields[1].asstring+#9+
                    qryItem1.fields[2].asstring+#9+
                    qryItem1.fields[3].asstring+#9+
                    qryItem1.fields[4].asstring);
      qryItem1.next;
    end;
    closefile(ffile);
  end;

  //Processo 2
  if chkItem2.enabled and chkItem2.checked then
  begin
    lblResultado.caption:='Processando fase 2. Identificando Pessoas na Tabela não na Prévia';
    lblResultado.update;
    if rgOrigem.itemindex = 0 then
      ssql:='SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.IDTITULAR, G.IDRESPONSAVEL '+
//            'FROM (SELECT DISTINCT IDTITULAR, IDRESPONSAVEL '+    //Everson TIBERO
            'FROM (SELECT DISTINCT T.IDTITULAR, T.IDRESPONSAVEL '+  //Everson TIBERO
                  'FROM '+edTabela.text+' T, PROVDESC PD '+
                  'WHERE T.IDRUBRICA = PD.IDPROVENTO '+
                  'AND PD.FLGDESCONTO IN (0,1) '+
                  'MINUS '+
//                  'SELECT DISTINCT IDTITULAR, IDRESPONSAVEL '+  //Everson TIBERO
                  'SELECT DISTINCT V.IDTITULAR, V.IDRESPONSAVEL '+//Everson TIBERO
                  'FROM PREVIA V, PROVDESC PD '+
//                  'WHERE IDLOTE '+PegaLotes+' '+ //Everson TIBERO
                  'WHERE V.IDLOTE '+PegaLotes+' '+ //Everson TIBERO
                  'AND V.IDRUBRICA = PD.IDPROVENTO '+
                  'AND PD.FLGDESCONTO IN (0,1) '
    else
      ssql:='SELECT DISTINCT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, G.IDTITULAR, G.IDRESPONSAVEL '+
//            'FROM (SELECT DISTINCT IDTITULAR, IDRESPONSAVEL '+   //Everson TIBERO
            'FROM (SELECT DISTINCT T.IDTITULAR, T.IDRESPONSAVEL '+ //Everson TIBERO
                  'FROM '+edTabela.text+' T, PROVDESC PD '+
                  'WHERE T.IDRUBRICA = PD.IDPROVENTO '+
                  'AND PD.FLGDESCONTO IN (0,1) '+
                  'MINUS '+
//                  'SELECT DISTINCT IDTITULAR, IDRESPONSAVEL '+   //Everson TIBERO
                  'SELECT DISTINCT V.IDTITULAR, V.IDRESPONSAVEL '+ //Everson TIBERO
                  'FROM HISTRUBSAL V, PROVDESC PD '+
//                  'WHERE IDHSTFOLHABENEF '+PegaLotes+' '+ //Everson TIBERO
                  'WHERE V.IDHSTFOLHABENEF '+PegaLotes+' '+ //Everson TIBERO
                  'AND V.FLGESTORNO = 0 '+
                  'AND V.IDRUBRICA = PD.IDPROVENTO '+
                  'AND PD.FLGDESCONTO IN (0,1) ';

    if cboxConsig.Checked then
//      ssql:=ssql+'AND FLGPENSAOALIM IN (0,1) ';//Everson TIBERO
      ssql:=ssql+'AND V.FLGPENSAOALIM IN (0,1) ';//Everson TIBERO
    ssql:=ssql+  ') G, ELEGPATRO E, DEPENTIT DP, PESSOA P '+
          'WHERE E.IDPESSOA = G.IDTITULAR '+
          'AND DP.IDTITULAR(+) = G.IDTITULAR '+
          'AND DP.IDPESSOA(+) = G.IDRESPONSAVEL '+
          'AND P.IDPESSOA = G.IDRESPONSAVEL '+
          'ORDER BY E.MATRICULA, MATDEP ';
    FazQuery(qryItem2,ssql);

    lblResultado.caption:='Salvando resultado da fase 2.';
    lblResultado.update;
    qryItem2.first;
    rewrite(ffile, lblarq2.caption);
    writeln(ffile,'MATR TITULAR'+#9+'MATR DEP.'+#9+'NOME'+#9+'IDTITULAR'+#9+'IDRESPONSAVEL');
    while not qryItem2.eof do
    begin
      writeln(ffile,qryItem2.fields[0].asstring+#9+
                    qryItem2.fields[1].asstring+#9+
                    qryItem2.fields[2].asstring+#9+
                    qryItem2.fields[3].asstring+#9+
                    qryItem2.fields[4].asstring);
      qryItem2.next;
    end;
    closefile(ffile);
  end;

  //Processo 3
  if chkItem3.enabled and chkItem3.checked then
  begin
    lblResultado.caption:='Processando fase 3. Identificando Pessoas com divergência de líquido';
    lblResultado.update;
    if rgOrigem.itemindex = 0 then
      ssql:='SELECT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, PL.IDTITULAR, PL.IDRESPONSAVEL, '+
                   'PL.LIQUIDO AS LIQPREVIA, TL.LIQUIDO AS LIQTABELA '+
            'FROM (SELECT V.IDTITULAR, V.IDRESPONSAVEL, '+
                         'SUM(DECODE(PV.FLGDESCONTO,0,V.VALORPROVENTO,1,(-1)*V.VALORPROVENTO)) AS LIQUIDO '+
                  'FROM PREVIA V, PROVDESC PV '+
                  'WHERE V.IDLOTE '+PegaLotes+' '+
                  'AND V.IDRUBRICA = PV.IDPROVENTO '+
                  'AND PV.FLGDESCONTO IN (0,1) '+
                  'GROUP BY V.IDTITULAR, V.IDRESPONSAVEL) PL, '+
                 '(SELECT V.IDTITULAR, V.IDRESPONSAVEL, '+
                         'SUM(DECODE(PV.FLGDESCONTO,0,V.VALORPROVENTO,1,(-1)*V.VALORPROVENTO)) AS LIQUIDO '+
                  'FROM '+edTabela.text+' V, PROVDESC PV '+
                  'WHERE V.IDRUBRICA = PV.IDPROVENTO '+
                  'AND PV.FLGDESCONTO IN (0,1) '+
                  'GROUP BY V.IDTITULAR, V.IDRESPONSAVEL) TL, ELEGPATRO E, DEPENTIT DP, PESSOA P '+
            'WHERE PL.IDTITULAR = TL.IDTITULAR '+
            'AND PL.IDRESPONSAVEL = TL.IDRESPONSAVEL '+
            'AND E.IDPESSOA = PL.IDTITULAR '+
            'AND DP.IDTITULAR(+) = PL.IDTITULAR '+
            'AND DP.IDPESSOA(+) = PL.IDRESPONSAVEL '+
            'AND P.IDPESSOA = PL.IDRESPONSAVEL '+
            'AND ABS(PL.LIQUIDO - TL.LIQUIDO) > '+eddif.text+' '+
            'ORDER BY E.MATRICULA, MATDEP '
    else
      ssql:='SELECT E.MATRICULA, DP.MATRICULA AS MATDEP, P.NOME, PL.IDTITULAR, PL.IDRESPONSAVEL, '+
                   'PL.LIQUIDO AS LIQPREVIA, TL.LIQUIDO AS LIQTABELA '+
            'FROM (SELECT V.IDTITULAR, V.IDRESPONSAVEL, '+
                         'SUM(DECODE(PV.FLGDESCONTO,0,V.VALORPROVENTO,1,(-1)*V.VALORPROVENTO)) AS LIQUIDO '+
                  'FROM HISTRUBSAL V, PROVDESC PV '+
                  'WHERE V.IDHSTFOLHABENEF '+PegaLotes+' '+
                  'AND V.FLGESTORNO = 0 '+
                  'AND V.IDRUBRICA = PV.IDPROVENTO '+
                  'AND PV.FLGDESCONTO IN (0,1) '+
                  'GROUP BY V.IDTITULAR, V.IDRESPONSAVEL) PL, '+
                 '(SELECT V.IDTITULAR, V.IDRESPONSAVEL, '+
                         'SUM(DECODE(PV.FLGDESCONTO,0,V.VALORPROVENTO,1,(-1)*V.VALORPROVENTO)) AS LIQUIDO '+
                  'FROM '+edTabela.text+' V, PROVDESC PV '+
                  'WHERE V.IDRUBRICA = PV.IDPROVENTO '+
                  'AND PV.FLGDESCONTO IN (0,1) '+
                  'GROUP BY V.IDTITULAR, V.IDRESPONSAVEL) TL, ELEGPATRO E, DEPENTIT DP, PESSOA P '+
            'WHERE PL.IDTITULAR = TL.IDTITULAR '+
            'AND PL.IDRESPONSAVEL = TL.IDRESPONSAVEL '+
            'AND E.IDPESSOA = PL.IDTITULAR '+
            'AND DP.IDTITULAR(+) = PL.IDTITULAR '+
            'AND DP.IDPESSOA(+) = PL.IDRESPONSAVEL '+
            'AND P.IDPESSOA = PL.IDRESPONSAVEL '+
            'AND ABS(PL.LIQUIDO - TL.LIQUIDO) > '+eddif.text+' '+
            'ORDER BY E.MATRICULA, MATDEP ';

    FazQuery(qryItem3,ssql);

    lblResultado.caption:='Salvando resultado da fase 3.';
    lblResultado.update;
    qryItem3.first;
    rewrite(ffile, lblarq3.caption);
    writeln(ffile,'MATR TITULAR'+#9+'MATR DEP.'+#9+'NOME'+#9+
                  'IDTITULAR'+#9+'IDRESPONSAVEL'+#9+'LIQ PREVIA'+#9+'LIQ TABELA');
    while not qryItem3.eof do
    begin
      writeln(ffile,qryItem3.fields[0].asstring+#9+
                    qryItem3.fields[1].asstring+#9+
                    qryItem3.fields[2].asstring+#9+
                    qryItem3.fields[3].asstring+#9+
                    qryItem3.fields[4].asstring+#9+
                    formatfloat('#0.00',qryItem3.fields[5].asfloat)+#9+
                    formatfloat('#0.00',qryItem3.fields[6].asfloat));
      qryItem3.next;
    end;
    closefile(ffile);
  end;

  //Processo 4
  if chkItem4.enabled and chkItem4.checked then
  begin
    lblResultado.caption:='Processando fase 4. Analítico de Rubricas';
    lblResultado.update;

    qryItem3.first;
    rewrite(ffile, lblarq4.caption);
    writeln(ffile,'ORIGEM'+#9+'MATR TITULAR'+#9+'MATR DEP.'+#9+
                  'NOME'+#9+'IDTITULAR'+#9+'IDRESPONSAVEL'+
                  'CÓD RUB'+#9+'DESCR RUB'+#9+'FLG PROV/DESC'+#9+'VALOR');
    while not qryItem3.eof do
    begin
      pnlResultado4.caption:='Processando matrícula:'+
        qryitem3.fieldbyname('matricula').asstring;
      pnlResultado4.update;
      qryRubricas.close;
      qryRubricas.parambyname('idtitular').asfloat:=
        qryitem3.fieldbyname('idtitular').asfloat;
      qryRubricas.parambyname('idresponsavel').asfloat:=
        qryitem3.fieldbyname('idresponsavel').asfloat;
      qryRubricas.open;

      while not qryRubricas.eof do
      begin
        writeln(ffile,qryRubricas.fields[0].asstring+#9+
                      qryRubricas.fields[1].asstring+#9+
                      qryRubricas.fields[2].asstring+#9+
                      qryRubricas.fields[3].asstring+#9+
                      qryRubricas.fields[4].asstring+#9+
                      qryRubricas.fields[5].asstring+#9+
                      qryRubricas.fields[6].asstring+#9+
                      qryRubricas.fields[7].asstring+#9+
                      qryRubricas.fields[8].asstring+#9+
                      formatfloat('#0.00',qryRubricas.fields[9].asfloat));
        qryRubricas.next;
      end;
      qryItem3.Next;
    end;
    closefile(ffile);
  end;

  //Processo 5
  if chkItem5.enabled and chkItem5.checked then
  begin
//    if (rgOpcao.itemindex = 1) and cboxEliminaTabelaBatimento.checked then
//    begin
//      lblResultado.caption:='Processando fase 5. Eliminando tabela de batimento.';
//      lblResultado.update;
//      EliminaBatimento(scodprovdesc: string);
//      ExecutarQuery(qryAux, 'DELETE FROM BATIMENTOFOLHA');
//    end;

    lblResultado.caption:='Processando fase 5. Elimando rubricas fora da Prévia.';
    lblResultado.update;

    ssql:='';
    for i:=0 to ListaRubricas.count-1 do
      ssql:=ssql+QuotedStr(ListaRubricas[i])+',';
    delete(ssql,length(ssql),1);

    ssql:='DELETE FROM BATIMENTOFOLHA '+
          'WHERE (VALORCM=0 AND VALORLEG=0) OR CODPROVDESC NOT IN ( '+ssql+')';

    ExecutarQuery(qryAux,ssql);


    lblResultado.caption:='Processando fase 5. Análise individual das rubricas.';
    lblResultado.update;
    if rgOpcao.itemindex = 0 then
      rewrite(ffile, lblarq5.caption);
    for i:=0 to chklstRubricas.items.count-1 do
      if chklstRubricas.checked[I] then
      begin
        if (rgOpcao.itemindex = 1) then
        begin
          lblResultado.caption:='Processando fase 5. Eliminando tabela de batimento rub:'+ListaRubricas[i];
          lblResultado.update;
          EliminaBatimento(ListaRubricas[i]);
        end;
        //BateRubrica(chklstRubricas.items[i],ListaRubricas[i]);
        BateRubrica1(chklstRubricas.items[i],ListaRubricas[i]);
      end;
    if rgOpcao.itemindex = 0 then
      closefile(ffile);
  end;
  ShowMessage('Batimentos selecionados concluídos. Verifique os arquivos de resultado.');
  lblResultado.caption:='';
  lblResultado.update;
//  btnProcessa.visible:=false;
end;

procedure TfrmBatimentoPrevia.chkItem3Click(Sender: TObject);
begin
  chkItem4.enabled:=chkItem3.checked;
  chkItem4.checked:=chkItem3.checked;
end;

procedure TfrmBatimentoPrevia.btnMontaRubricaClick(Sender: TObject);
 var ssql: string;
     i: integer;
begin
  qryRubCM.close;
  qryRubLeg.close;
  if rgOrigem.itemindex = 0 then
    ssql:='SELECT MAX(V.IDLOTE) AS IDLOTE, P.DESCRICAO, P.CODPROVDESC, '+
                 'SUM(DECODE(P.FLGDESCONTO,2,V.VALORINFO,V.VALORPROVENTO)) AS VALORPROVENTO, '+
                 'DECODE(P.FLGDESCONTO,0,''(+)'',1,''(-)'',''(*)'') AS TP '+
          'FROM PREVIA V, PROVDESC P '+
          'WHERE V.IDLOTE ' +PegaLotes+' '+
          'AND P.IDPROVENTO = V.IDRUBRICA '+
          'AND V.IDTITULAR = :IDTITULAR '+
          'AND V.IDRESPONSAVEL = :IDRESPONSAVEL '+
          'GROUP BY P.DESCRICAO, P.CODPROVDESC, P.FLGDESCONTO '+
          'ORDER BY P.FLGDESCONTO, P.CODPROVDESC '
  else
    ssql:='SELECT MAX(V.IDHSTFOLHABENEF) AS IDLOTE, P.DESCRICAO, P.CODPROVDESC, '+
                 'SUM(DECODE(P.FLGDESCONTO,2,V.VALORINFO,V.VALORPROVENTO)) AS VALORPROVENTO, '+
                 'DECODE(P.FLGDESCONTO,0,''(+)'',1,''(-)'',''(*)'') AS TP '+
          'FROM HISTRUBSAL V, PROVDESC P '+
          'WHERE V.IDHSTFOLHABENEF ' +PegaLotes+' '+
          'AND V.FLGESTORNO = 0 '+
          'AND P.IDPROVENTO = V.IDRUBRICA '+
          'AND V.IDTITULAR = :IDTITULAR '+
          'AND V.IDRESPONSAVEL = :IDRESPONSAVEL '+
          'GROUP BY P.DESCRICAO, P.CODPROVDESC, P.FLGDESCONTO '+
          'ORDER BY P.FLGDESCONTO, P.CODPROVDESC ';

  qryRubCM.sql.text:=ssql;
  qryRubCM.prepare;
  qryRubLeg.prepare;

  ssql:='SELECT CODPROVDESC, FLGDESCONTO, '+
               'CODPROVDESC||''-''||FLGDESCONTO||''-''||DESCRICAO AS DESCRICAO '+
        'FROM (';

  for i:=0 to chklstOrigem.items.count-1 do
    if chklstOrigem.checked[I] then
    begin
      if rgOrigem.itemindex = 0 then
        ssql:=ssql+
//          'SELECT /*+ INDEX (XIE6PREVIA) */ DISTINCT PD.CODPROVDESC, PD.FLGDESCONTO, '+ //Everson TIBERO
          'SELECT DISTINCT PD.CODPROVDESC, PD.FLGDESCONTO, '+                             //Everson TIBERO
                 'NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO '+
          'FROM PREVIA V, PROVDESC PD '+
          'WHERE V.IDLOTE = '+ListaOrigem[I]+' '+
          'AND V.IDRUBRICA = PD.IDPROVENTO '+
          'UNION '
      else
        ssql:=ssql+
//          'SELECT /*+ RULE */ DISTINCT PD.CODPROVDESC, PD.FLGDESCONTO, '+ //Everson TIBERO
          'SELECT DISTINCT PD.CODPROVDESC, PD.FLGDESCONTO, '+               //Everson TIBERO
                 'NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO '+
          'FROM HISTRUBSAL V, PROVDESC PD '+
          'WHERE V.IDHSTFOLHABENEF = '+ListaOrigem[I]+' '+
          'AND V.FLGESTORNO = 0 '+
          'AND V.IDRUBRICA = PD.IDPROVENTO '+
          'UNION '
    end;

  ssql:=ssql+
//    'SELECT DISTINCT CODPROVDESC, FLGDESCONTO, NVL(DESCRPROVDESC,DESCRICAO) AS DESCRICAO '+            //Everson TIBERO
    'SELECT DISTINCT P1.CODPROVDESC, P1.FLGDESCONTO, NVL(P1.DESCRPROVDESC, P1.DESCRICAO) AS DESCRICAO '+ //Everson TIBERO
    'FROM PROVDESC P1, '+
       '(SELECT DISTINCT R.RUBCM '+
        'FROM RUBRICASCMXLEGADO R, '+
//             '(SELECT /*+ INDEX (PRVR01) */ DISTINCT V.IDRUBRICA, PD.CODPROVDESC '+ //Everson TIBERO
             '(SELECT DISTINCT V.IDRUBRICA, PD.CODPROVDESC '+                         //Everson TIBERO
              'FROM TABRUBRICAS V, PROVDESC PD '+
              'WHERE V.IDRUBRICA = PD.IDPROVENTO) G1 '+
        'WHERE G1.CODPROVDESC = R.RUBLEG) G2 '+
    'WHERE P1.CODPROVDESC = G2.RUBCM '+
    ') ORDER BY FLGDESCONTO, CODPROVDESC ';

  FazQuery(qryAux,ssql);
  chklstRubricas.items.clear;
  ListaRubricas.clear;
  while not qryAux.eof do
  begin
    chklstRubricas.items.add(qryAux.fieldbyname('DESCRICAO').asstring);
    chklstRubricas.ItemIndex:=0;
    ListaRubricas.add(qryAux.fieldbyname('CODPROVDESC').asstring);
    qryAux.Next;
  end;
  tbsAnaliseBatimento.tabvisible:=true;
  tbsBateRubrica.tabvisible:=true;
  bbtnConfirmar.visible:=true;
end;

procedure TfrmBatimentoPrevia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ListaRubricas.free;
  ListaOrigem.free;
  inherited;
end;

procedure TfrmBatimentoPrevia.cboxRubricasClick(Sender: TObject);
begin
  if (activecontrol = sender) then
  begin
    If chklstRubricas.ItemIndex>=0 then
      MarcaLista(chklstRubricas, cboxRubricas.checked);
  end;
end;

function TfrmBatimentoPrevia.PegaLotes: string;
var lii: integer;
    sOrigem: string;
begin
  MontaFiltroCompleto(chklstOrigem, ListaOrigem, sOrigem);
  if pos(',',sOrigem) = 0 then
    result:=' = '+sOrigem
  else
    result:=' IN ('+sOrigem+')';
end;

procedure TfrmBatimentoPrevia.bbtnAtualizaAssociacaoClick(Sender: TObject);
begin
  try
    dtmBaseDados.dbBaseDados.StartTransaction;
    ExecutarQuery(qryAux, 'INSERT INTO RUBRICASCMXLEGADO (RUBCM, RUBLEG) '+
                          'SELECT P.CODPROVDESC, P.CODPROVDESC '+
                          'FROM PROVDESC P '+
                          'WHERE P.FLGTPRUBRICA LIKE ''%B%'' '+
                          'AND NOT EXISTS (SELECT 1 '+
                                          'FROM RUBRICASCMXLEGADO R '+
                                          'WHERE R.RUBLEG = P.CODPROVDESC) ');
    dtmBaseDados.dbBaseDados.Commit;
  except
  end;
end;

procedure TfrmBatimentoPrevia.bbtnConfirmaAlteracoesClick(Sender: TObject);
 var scod: string;
begin
  if qryAssoc.updatespending then
  begin
    scod:=qryAssoc.fieldbyname('RUBLEG').asstring;
    updAssoc.Apply(ukModify);
    qryAssoc.close;
    qryAssoc.open;
    qryAssoc.locate('RUBLEG', scod, []);
  end;
end;

procedure TfrmBatimentoPrevia.qryAssocBeforeScroll(DataSet: TDataSet);
begin
  bbtnConfirmaAlteracoesClick(bbtnConfirmaAlteracoes);
end;

procedure TfrmBatimentoPrevia.rgOpcaoBatimentoClick(Sender: TObject);
//var sfiltro: string;
begin
//  case rgOpcaoRub.itemindex of
//    0:  sfiltro:='';
//    1:  sfiltro:='AND B.VALORCM > 0 AND B.VALORLEG > 0 ';
//    2:  sfiltro:='AND B.VALORCM > 0 AND B.VALORLEG = 0 ';
//    3:  sfiltro:='AND B.VALORCM = 0 AND B.VALORLEG > 0 ';
//  end;

  if not tbsAnaliseBatimento.tabvisible then exit;
  
  qryBatimentoLista.close;
//  qryBatimento.close;
  btnGeraLista.visible:=(rgOpcaoBatimento.ItemIndex=0);
  if rgOpcaoBatimento.ItemIndex = 0 then
  begin
    lblFiltro.caption:='Rubricas';
    dbgFiltro.Selected.clear;
    dbgFiltro.Selected.add('CODPROVDESC'#9'9'#9'Código'#9'F');
    dbgFiltro.Selected.add('DIVTOTAL'#9'7'#9'Div.Total'#9'F');
    dbgFiltro.Selected.add('ACEITOS'#9'7'#9'Aceitas'#9'F');
    dbgFiltro.Selected.add('DESCRICAO'#9'100'#9'Rubrica'#9'F');
    qryBatimentoLista.sql.text:=
      'SELECT B.CODPROVDESC||''-''||P.DESCRICAO AS COMPLETO, '+
             'COUNT(*) AS DIVTOTAL, B.CODPROVDESC, P.DESCRICAO, '+
             'SUM(DECODE(D.IDPESSOA,NULL,0,1)) AS ACEITOS '+
      'FROM BATIMENTOFOLHA B, DIVERGENCIAFOLHA D, '+
      '(SELECT DISTINCT CODPROVDESC, DESCRICAO FROM PROVDESC) P '+
      'WHERE B.CODPROVDESC = P.CODPROVDESC '+
      'AND (B.VALORCM > 0 OR B.VALORLEG > 0) '+
      'AND B.IDTITULAR = D.IDTITULAR(+) '+
      'AND B.IDPESSOA = D.IDPESSOA(+) '+
      'AND B.CODPROVDESC = D.CODPROVDESC(+) '+
      'GROUP BY B.CODPROVDESC, P.DESCRICAO '+
      'ORDER BY B.CODPROVDESC';
    qryBatimentoLista.open;
  end
  else
  begin
    lblFiltro.caption:='Pessoas';
    dbgFiltro.Selected.clear;
    dbgFiltro.Selected.add('MATDEP'#9'8'#9'MATDEP'#9'F');
    dbgFiltro.Selected.add('MATTIT'#9'8'#9'MATTIT'#9'F');
    qryBatimentoLista.sql.text:='SELECT DISTINCT MATDEP, MATTIT, MATTIT||''-''||MATDEP AS MATRICULAS '+
                                'FROM BATIMENTOFOLHA '+
                                'ORDER BY MATDEP';
    qryBatimentoLista.open;
  end;
  PreparaQryBatimento;
end;

procedure TfrmBatimentoPrevia.PreparaQryBatimento;
var sfiltro: string;
begin
  sfiltro:='';
  case rgOpcaoRub.itemindex of
    0:  sfiltro:='';
    1:  sfiltro:='AND B.VALORCM > 0 AND B.VALORLEG > 0 ';
    2:  sfiltro:='AND B.VALORCM > 0 AND B.VALORLEG = 0 ';
    3:  sfiltro:='AND B.VALORCM = 0 AND B.VALORLEG > 0 ';
  end;

  //P.RAMOS - FUNCEF - 28.12.2003
  case rgDivergencia.itemindex of
    0:  sfiltro:='';
    1:  sfiltro:=sfiltro+'AND EXISTS (SELECT 1 '+
                                     'FROM DIVERGENCIAFOLHA D '+
                                     'WHERE D.IDTITULAR = B.IDTITULAR '+
                                     'AND D.IDPESSOA = B.IDPESSOA '+
                                     'AND D.CODPROVDESC = B.CODPROVDESC) ';
    2:  sfiltro:=sfiltro+'AND NOT EXISTS (SELECT 1 '+
                                         'FROM DIVERGENCIAFOLHA D '+
                                         'WHERE D.IDTITULAR = B.IDTITULAR '+
                                         'AND D.IDPESSOA = B.IDPESSOA '+
                                         'AND D.CODPROVDESC = B.CODPROVDESC) ';
  end;

  qryBatimento.close;
  if rgOpcaoBatimento.ItemIndex = 0 then
  begin
    qryBatimento.sql.text:='SELECT 0 AS MARCA, 0 AS MARCADO, B.*, P.NOME, DV.IDTITULAR AS DVTITULAR '+
                           'FROM BATIMENTOFOLHA B, PESSOA P, DIVERGENCIAFOLHA DV '+
                           'WHERE B.IDPESSOA = P.IDPESSOA '+
                           'AND B.IDTITULAR = DV.IDTITULAR(+) '+
                           'AND B.IDPESSOA = DV.IDPESSOA(+) '+
                           'AND B.CODPROVDESC = DV.CODPROVDESC(+) '+
                           'AND NOT (B.VALORCM = 0 AND B.VALORLEG = 0) '+
                           'AND B.CODPROVDESC = :CODPROVDESC '+sfiltro+
                           'ORDER BY B.MATTIT, B.MATDEP';
    qryBatimento.parambyname('CODPROVDESC').datatype:=ftstring;
    qryBatimento.prepare;
  end
  else
  begin
    qryBatimento.sql.text:='SELECT 0 AS MARCA, 0 AS MARCADO, B.*, P.NOME, DV.IDTITULAR AS DVTITULAR '+
                           'FROM BATIMENTOFOLHA B, PESSOA P, DIVERGENCIAFOLHA DV '+
                           'WHERE B.IDPESSOA = P.IDPESSOA '+
                           'AND B.IDTITULAR = DV.IDTITULAR(+) '+
                           'AND B.IDPESSOA = DV.IDPESSOA(+) '+
                           'AND B.CODPROVDESC = DV.CODPROVDESC(+) '+
                           'AND NOT (B.VALORCM = 0 AND B.VALORLEG = 0) '+
                           'AND B.MATTIT = :MATTIT '+
                           'AND B.MATDEP = :MATDEP '+sfiltro+
                           'ORDER BY B.MATTIT, B.MATDEP';
    qryBatimento.parambyname('MATTIT').datatype:=ftstring;
    qryBatimento.parambyname('MATDEP').datatype:=ftstring;
    qryBatimento.prepare;
  end;
end;

procedure TfrmBatimentoPrevia.AbreQryBatimento;
var inum: integer;
begin
  qryBatimento.close;
  if rgOpcaoBatimento.ItemIndex = 0 then
  begin
    qryBatimento.ParamByName('CODPROVDESC').asstring:=
      qryBatimentoLista.fieldbyname('CODPROVDESC').asstring;
  end
  else
  begin
    qryBatimento.ParamByName('MATTIT').asstring:=
      qryBatimentoLista.fieldbyname('MATTIT').asstring;
    qryBatimento.ParamByName('MATDEP').asstring:=
      qryBatimentoLista.fieldbyname('MATDEP').asstring;
  end;
  inum:=0;
  qryBatimento.open;
  qryBatimento.disablecontrols;
  while not qryBatimento.eof do
  begin
    inc(inum);
    if not qrybatimento.fieldbyname('DVTITULAR').isnull then
    begin
      qryBatimento.Edit;
      qryBatimento.fieldbyname('MARCADO').asinteger:=1;
      qryBatimento.post;
    end;
    qryBatimento.next;
  end;
  qryBatimento.first;
  qryBatimento.enablecontrols;
  lblQuantidade.caption:='Quantidade Selecionada: '+inttostr(inum);
  //PageControl2.activepage:=tbsOcorrencias;
end;

procedure TfrmBatimentoPrevia.rgOpcaoRubClick(Sender: TObject);
begin
  PreparaQryBatimento;
  AbreQryBatimento;
end;

procedure TfrmBatimentoPrevia.qryBatimentoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if pagecontrol2.activepage = tbsRubricas then
    PageControl2Change(tbsRubricas);
end;

procedure TfrmBatimentoPrevia.PageControl2Change(Sender: TObject);
var rdcm, rpcm, rlcm, rdleg, rpleg, rlleg: real;
begin
  if pagecontrol2.activepage = tbsOcorrencias then
  begin
    if bMudou then
      AbreQryBatimento;
  end
  else
  if pagecontrol2.activepage = tbsRubricas then
  begin
    bMudou:=false;
    qryRubCM.close;
    qryRubCM.parambyname ('IDTITULAR').asfloat    :=qryBatimento.fieldbyname('IDTITULAR').asfloat;
    qryRubCM.parambyname ('IDRESPONSAVEL').asfloat:=qryBatimento.fieldbyname('IDPESSOA').asfloat;
    qryRubCM.open;
    qryRubLeg.close;
    qryRubLeg.parambyname('IDTITULAR').asfloat    :=qryBatimento.fieldbyname('IDTITULAR').asfloat;
    qryRubLeg.parambyname('IDRESPONSAVEL').asfloat:=qryBatimento.fieldbyname('IDPESSOA').asfloat;
    qryRubLeg.open;
    lblLote.caption:='Lote:'+qryRubCm.fieldbyname('idlote').asstring;
    lblMattit.caption:='Mat.Tit.:'+qryBatimento.fieldbyname('mattit').asstring;
    lblMatdep.caption:='Mat.Dep.:'+qryBatimento.fieldbyname('matdep').asstring;
    lblnomedep.caption:='Nome:'+qryBatimento.fieldbyname('nome').asstring;

    rdCM:=0;
    rpCM:=0;
    rlCM:=0;
    while not qryRubCM.Eof do
    begin
      if qryRubCM.fieldbyname('tp').asstring = '(+)' then
      begin
        rpCM:=rpcm+qryRubCM.fieldbyname('valorprovento').asfloat;
        rlCM:=rlcm+qryRubCM.fieldbyname('valorprovento').asfloat;
      end;
      if qryRubCM.fieldbyname('tp').asstring = '(-)' then
      begin
        rdCM:=rdcm+qryRubCM.fieldbyname('valorprovento').asfloat;
        rlCm:=rlcm-qryRubCM.fieldbyname('valorprovento').asfloat;
      end;
      qryRubCM.next;
    end;
    qryRubCM.first;
    lblprovcm.caption:=formatfloat('#0.00',rpcm);
    lbldesccm.caption:=formatfloat('#0.00',rdcm);
    lblliqcm.caption :=formatfloat('#0.00',rlcm);

    rdleg:=0;
    rpleg:=0;
    rlleg:=0;
    while not qryrubleg.Eof do
    begin
      if qryrubleg.fieldbyname('tp').asstring = '(+)' then
      begin
        rpleg:=rpleg+qryrubleg.fieldbyname('valorprovento').asfloat;
        rlleg:=rlleg+qryrubleg.fieldbyname('valorprovento').asfloat;
      end;
      if qryrubleg.fieldbyname('tp').asstring = '(-)' then
      begin
        rdleg:=rdleg+qryrubleg.fieldbyname('valorprovento').asfloat;
        rlleg:=rlleg-qryrubleg.fieldbyname('valorprovento').asfloat;
      end;
      qryrubleg.next;
    end;
    qryrubleg.first;
    lblprovleg.caption:=formatfloat('#0.00',rpleg);
    lbldescleg.caption:=formatfloat('#0.00',rdleg);
    lblliqleg.caption :=formatfloat('#0.00',rlleg);

    lbldifprov.caption:=formatfloat('#0.00',rpcm-rpleg);
    lbldifdesc.caption:=formatfloat('#0.00',rdcm-rdleg);
    lbldifliq.caption :=formatfloat('#0.00',rlcm-rlleg);
  end;
end;

procedure TfrmBatimentoPrevia.EliminaBatimento(scodprovdesc: string);
begin
  ExecutarQuery(qryAux, 'DELETE FROM BATIMENTOFOLHA WHERE CODPROVDESC = '+
    QuotedStr(scodprovdesc));
end;

procedure TfrmBatimentoPrevia.btnGeraListaClick(Sender: TObject);
var iProxLista: Integer;
    iret: integer;
    bcria: boolean;
begin
  inherited;
  bcria:=true;
  if FazQuery(qryAux, 'SELECT IDLISTA FROM LISTAFOLHABENEF WHERE NOME = '+
       QuotedStr('Lista Batimento Rub:'+qryBatimentoLista.fieldbyname('CODPROVDESC').asstring)) then
  begin
    iret:=MsgDlg('Já existe esta lista de pessoas. Deseja substituir a lista (S) ou criar uma nova (N) ou cancelar a criação (Cancelar) ?',
       'Informação',mtInformation,[mbYes,mbNo,mbCancel,mbHelp],0);

    if iret = mrCancel then
      exit;

    if iret = mrYes then
    begin
      bcria:=false;
      iProxLista:=qryAux.fieldbyname('IDLISTA').asinteger;
      ExecutarQuery(qryAux, 'DELETE LISTAFOLHABENEFDET WHERE IDLISTA = '+inttostr(iProxLista));
    end
    else
      iProxLista:=LeUltRegistro(Nil,'LISTAFOLHABENEF');
  end
  else
    iProxLista:=LeUltRegistro(Nil,'LISTAFOLHABENEF');

  if bcria then
    ExecutarQuery(qryAux, 'INSERT INTO LISTAFOLHABENEF (IDLISTA, FLGTIPOLISTA, '+
      'NOME) VALUES ('+inttostr(iProxLista)+',0,''Lista Batimento Rub:'+
      qryBatimentoLista.fieldbyname('CODPROVDESC').asstring+''')');

  ExecutarQuery(qryAux, 'INSERT INTO LISTAFOLHABENEFDET '+
    '(IDLISTA, IDTITULAR, IDPESSOA, IDREFERENCIA) '+
    'SELECT DISTINCT '+inttostr(iProxLista)+' AS IDLISTA, IDTITULAR, IDPESSOA, 0 '+
    'FROM BATIMENTOFOLHA '+
    'WHERE CODPROVDESC = '+
      QuotedStr(qryBatimentoLista.fieldbyname('CODPROVDESC').asstring));
end;

procedure TfrmBatimentoPrevia.rgOpcaoClick(Sender: TObject);
begin
  inherited;
  lblArquivo.visible:=rgopcao.itemindex=0;
  pnlArqBatimento.visible:=rgopcao.itemindex=0;
  spbtnArqBatimento.visible:=rgopcao.itemindex=0;
  lblObsBatimento.visible:=rgopcao.itemindex=0;
end;

procedure TfrmBatimentoPrevia.btnImprimirClick(Sender: TObject);
var sfiltro: string;
begin
  inherited;
  sfiltro:='';
  case rgOpcaoRub.itemindex of
    0:  sfiltro:='';
    1:  sfiltro:='AND B.VALORCM > 0 AND B.VALORLEG > 0 ';
    2:  sfiltro:='AND B.VALORCM > 0 AND B.VALORLEG = 0 ';
    3:  sfiltro:='AND B.VALORCM = 0 AND B.VALORLEG > 0 ';
  end;

  //P.RAMOS - FUNCEF - 28.12.2003
  case rgDivergencia.itemindex of
    0:  sfiltro:='';
    1:  sfiltro:=sfiltro+'AND EXISTS (SELECT 1 '+
                                     'FROM DIVERGENCIAFOLHA D '+
                                     'WHERE D.IDTITULAR = B.IDTITULAR '+
                                     'AND D.IDPESSOA = B.IDPESSOA '+
                                     'AND D.CODPROVDESC = B.CODPROVDESC) ';
    2:  sfiltro:=sfiltro+'AND NOT EXISTS (SELECT 1 '+
                                         'FROM DIVERGENCIAFOLHA D '+
                                         'WHERE D.IDTITULAR = B.IDTITULAR '+
                                         'AND D.IDPESSOA = B.IDPESSOA '+
                                         'AND D.CODPROVDESC = B.CODPROVDESC) ';
  end;

  sfiltro:='SELECT B.IDTITULAR, B.IDPESSOA '+
           'FROM BATIMENTOFOLHA B '+
           'WHERE B.CODPROVDESC = '+QuotedStr(qryBatimentoLista.fieldbyname('CODPROVDESC').asstring)+' '+#13+
           'AND NOT (B.VALORCM = 0 AND B.VALORLEG = 0) '+sfiltro;

  qryRelat.close;
  qryRelat.sql.Clear;
  if rgOrigem.itemindex = 0 then
    qryRelat.sql.text:=
      'SELECT MATRICULA, IDTITULAR, IDRESPONSAVEL, IDLOTE, CODPROVDESC, MES, '+#13+
             'DESCRICAO, VALORPROVENTO, TP, NUMDEPIRRF, ISENTO, IRTOTAL, NOME '+#13+
      'FROM ( '+#13+
      'SELECT D.MATRICULA, V.IDTITULAR, V.IDRESPONSAVEL, ''CM-''||V.IDLOTE AS IDLOTE, P.CODPROVDESC, V.MES, '+#13+
             'P.FLGDESCONTO, P.DESCRICAO, DECODE(P.FLGDESCONTO,2,V.VALORINFO,V.VALORPROVENTO) AS VALORPROVENTO, '+#13+
             'DECODE(P.FLGDESCONTO,0,''(+)'',1,''(-)'',''(*)'') AS TP, '+#13+
             'NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF, '+#13+
             'DECODE(PF.FLGISENTOIRRF,1,''SIM'',''NÃO'') AS ISENTO, '+#13+
             'DECODE(PF.FLGSOMAIRSUPINSS,1,''SIM'',''NÃO'') AS IRTOTAL, PR.NOME '+#13+
      'FROM PREVIA V, PROVDESC P, PESSOAFISICA PF, PESSOA PR, DEPENTIT D, '+#13+
           '('+sfiltro+') B '+#13+
      'WHERE V.IDLOTE '+PegaLotes+' '+#13+
      'AND P.IDPROVENTO = V.IDRUBRICA '+#13+
      'AND V.IDTITULAR = D.IDTITULAR '+#13+
      'AND V.IDRESPONSAVEL = D.IDPESSOA '+#13+
      'AND PF.IDPESSOA = V.IDRESPONSAVEL '+#13+
      'AND PR.IDPESSOA = V.IDRESPONSAVEL '+#13+
      'AND V.IDTITULAR = B.IDTITULAR '+#13+
      'AND V.IDRESPONSAVEL = B.IDPESSOA '+#13+
  //    'AND B.CODPROVDESC = '+QuotedStr(qryBatimentoLista.fieldbyname('CODPROVDESC').asstring)+' '+#13+
      'UNION ALL '+#13+
      'SELECT D.MATRICULA, V.IDTITULAR, V.IDRESPONSAVEL, ''SBE'' AS IDLOTE, P.CODPROVDESC, V.MES, '+#13+
             'P.FLGDESCONTO, P.DESCRICAO, V.VALORPROVENTO, '+#13+
             'DECODE(P.FLGDESCONTO,0,''(+)'',1,''(-)'',''(*)'') AS TP, '+#13+
             'NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF, '+#13+
             'DECODE(PF.FLGISENTOIRRF,1,''SIM'',''NÃO'') AS ISENTO, '+#13+
             'DECODE(PF.FLGSOMAIRSUPINSS,1,''SIM'',''NÃO'') AS IRTOTAL, PR.NOME '+#13+
      'FROM '+edTabela.text+' V, PROVDESC P, PESSOAFISICA PF, PESSOA PR, DEPENTIT D, '+#13+
            '('+sfiltro+') B '+#13+
      'WHERE P.IDPROVENTO = V.IDRUBRICA '+#13+
      'AND V.IDTITULAR = D.IDTITULAR '+#13+
      'AND V.IDRESPONSAVEL = D.IDPESSOA '+#13+
      'AND PF.IDPESSOA = V.IDRESPONSAVEL '+#13+
      'AND PR.IDPESSOA = V.IDRESPONSAVEL '+#13+
      'AND V.IDTITULAR = B.IDTITULAR '+#13+
      'AND V.IDRESPONSAVEL = B.IDPESSOA '+#13+
  //    'AND B.CODPROVDESC = '+QuotedStr(qryBatimentoLista.fieldbyname('CODPROVDESC').asstring)+' '+#13+
      ') ORDER BY MATRICULA, FLGDESCONTO, CODPROVDESC, IDLOTE '
  else
    qryRelat.sql.text:=
      'SELECT MATRICULA, IDTITULAR, IDRESPONSAVEL, IDLOTE, CODPROVDESC, MES, '+#13+
             'DESCRICAO, VALORPROVENTO, TP, NUMDEPIRRF, ISENTO, IRTOTAL, NOME '+#13+
      'FROM ( '+#13+
      'SELECT D.MATRICULA, V.IDTITULAR, V.IDRESPONSAVEL, ''CM-''||V.IDLOTE AS IDLOTE, P.CODPROVDESC, V.MES, '+#13+
             'P.FLGDESCONTO, P.DESCRICAO, DECODE(P.FLGDESCONTO,2,V.VALORINFO,V.VALORPROVENTO) AS VALORPROVENTO, '+#13+
             'DECODE(P.FLGDESCONTO,0,''(+)'',1,''(-)'',''(*)'') AS TP, '+#13+
             'NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF, '+#13+
             'DECODE(PF.FLGISENTOIRRF,1,''SIM'',''NÃO'') AS ISENTO, '+#13+
             'DECODE(PF.FLGSOMAIRSUPINSS,1,''SIM'',''NÃO'') AS IRTOTAL, PR.NOME '+#13+
      'FROM HISTRUBSAL V, PROVDESC P, PESSOAFISICA PF, PESSOA PR, DEPENTIT D, '+#13+
           '('+sfiltro+') B '+#13+
      'WHERE V.IDHSTFOLHABENEF '+PegaLotes+' '+#13+
      'AND V.FLGESTORNO = 0 '+
      'AND P.IDPROVENTO = V.IDRUBRICA '+#13+
      'AND V.IDTITULAR = D.IDTITULAR '+#13+
      'AND V.IDRESPONSAVEL = D.IDPESSOA '+#13+
      'AND PF.IDPESSOA = V.IDRESPONSAVEL '+#13+
      'AND PR.IDPESSOA = V.IDRESPONSAVEL '+#13+
      'AND V.IDTITULAR = B.IDTITULAR '+#13+
      'AND V.IDRESPONSAVEL = B.IDPESSOA '+#13+
  //    'AND B.CODPROVDESC = '+QuotedStr(qryBatimentoLista.fieldbyname('CODPROVDESC').asstring)+' '+#13+
      'UNION ALL '+#13+
      'SELECT D.MATRICULA, V.IDTITULAR, V.IDRESPONSAVEL, ''SBE'' AS IDLOTE, P.CODPROVDESC, V.MES, '+#13+
             'P.FLGDESCONTO, P.DESCRICAO, V.VALORPROVENTO, '+#13+
             'DECODE(P.FLGDESCONTO,0,''(+)'',1,''(-)'',''(*)'') AS TP, '+#13+
             'NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF, '+#13+
             'DECODE(PF.FLGISENTOIRRF,1,''SIM'',''NÃO'') AS ISENTO, '+#13+
             'DECODE(PF.FLGSOMAIRSUPINSS,1,''SIM'',''NÃO'') AS IRTOTAL, PR.NOME '+#13+
      'FROM '+edTabela.text+' V, PROVDESC P, PESSOAFISICA PF, PESSOA PR, DEPENTIT D, '+#13+
            '('+sfiltro+') B '+#13+
      'WHERE P.IDPROVENTO = V.IDRUBRICA '+#13+
      'AND V.IDTITULAR = D.IDTITULAR '+#13+
      'AND V.IDRESPONSAVEL = D.IDPESSOA '+#13+
      'AND PF.IDPESSOA = V.IDRESPONSAVEL '+#13+
      'AND PR.IDPESSOA = V.IDRESPONSAVEL '+#13+
      'AND V.IDTITULAR = B.IDTITULAR '+#13+
      'AND V.IDRESPONSAVEL = B.IDPESSOA '+#13+
  //    'AND B.CODPROVDESC = '+QuotedStr(qryBatimentoLista.fieldbyname('CODPROVDESC').asstring)+' '+#13+
      ') ORDER BY MATRICULA, FLGDESCONTO, CODPROVDESC, IDLOTE ';

  qryRelat.open;
  pprRelat.print;
end;

procedure TfrmBatimentoPrevia.btnAplicaClick(Sender: TObject);
begin
  inherited;
  qryBatimento.disablecontrols;
  qryBatimento.first;
  while not qryBatimento.eof do
  begin
    if (qryBatimento.fieldbyname('MARCA').asinteger = 1) then
    begin
      if (qryBatimento.fieldbyname('MARCADO').asinteger = 0) then
      begin
        ExecutarQuery(qryAux, 'INSERT INTO DIVERGENCIAFOLHA '+
          '(IDTITULAR, IDPESSOA, CODPROVDESC) VALUES ('+
          qryBatimento.fieldbyname('IDTITULAR').asstring+','+
          qryBatimento.fieldbyname('IDPESSOA').asstring+','+
          QuotedStr(qryBatimento.fieldbyname('CODPROVDESC').asstring)+')');
      end
      else
      begin
        ExecutarQuery(qryAux, 'DELETE FROM DIVERGENCIAFOLHA '+
          'WHERE IDTITULAR = '+qryBatimento.fieldbyname('IDTITULAR').asstring+' '+
          'AND IDPESSOA = '+qryBatimento.fieldbyname('IDPESSOA').asstring+' '+
          'AND CODPROVDESC = '+QuotedStr(qryBatimento.fieldbyname('CODPROVDESC').asstring));
      end;
    end;
    qryBatimento.next;
  end;
  qryBatimento.enablecontrols;
  AbreQryBatimento;
end;

procedure TfrmBatimentoPrevia.dbgBatimentoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if qryBatimento.active and not qryBatimento.isempty then
  begin
    if (qryBatimento.fieldbyname('MARCADO').asinteger = 1) then
      abrush.color:=clyellow
    else
      if Highlight then
        abrush.color:=clHighlight
      else
        abrush.color:=clWindow;
  end;
end;

procedure TfrmBatimentoPrevia.qryBatimentoListaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  bMudou:=activecontrol = dbgFiltro;
end;

procedure TfrmBatimentoPrevia.rgOrigemClick(Sender: TObject);
begin
  inherited;
  AbreOrigem(rgOrigem.itemindex);
end;

procedure TfrmBatimentoPrevia.AbreOrigem(aiOrigem: integer);
var ssql: string;
begin
  if rgOrigem.itemindex = 0 then
    ssql:='SELECT IDLOTE, MESREFERENCIA, DESCRICAO '+
          'FROM CTRLINTERFACE '+
          'WHERE TIPO = ''B'' '+
          'AND FLGVOLTATMP = 0 '+
          'AND FLGIDATMP = 1 '+
          'ORDER BY IDLOTE DESC'
  else
    ssql:='SELECT IDHSTFOLHABENEF AS IDLOTE, MESREFERENCIA, HISTORICO AS DESCRICAO '+
          'FROM HSTFOLHABENEF '+
          'ORDER BY IDHSTFOLHABENEF DESC';

  qryOrigem.close;
  qryOrigem.sql.clear;
  qryOrigem.sql.add(ssql);
  qryOrigem.open;
  chklstOrigem.Clear;
  ListaOrigem.Clear;
  While Not qryOrigem.eof Do
  Begin
    chklstOrigem.Items.Add(qryOrigem.FieldByName('IDLOTE').AsString+'-'+
      qryOrigem.FieldByName('DESCRICAO').AsString);
    chklstOrigem.ItemIndex := 0;
    ListaOrigem.Add(qryOrigem.FieldByName('IDLOTE').AsString);
    qryOrigem.Next;
  End;
end;

procedure TfrmBatimentoPrevia.FormCreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        lblarq1.Caption:= Sitema.RetornaCaminhoArquivos(Sitema.IdEmpresa)+'\Batimento-Fase1.txt';
        lblarq2.Caption:= Sitema.RetornaCaminhoArquivos(Sitema.IdEmpresa)+'\Batimento-Fase2.txt';
        lblarq3.Caption:= Sitema.RetornaCaminhoArquivos(Sitema.IdEmpresa)+'\Batimento-Fase3.txt';
        lblarq4.Caption:= Sitema.RetornaCaminhoArquivos(Sitema.IdEmpresa)+'\Batimento-Fase4.txt';
        lblarq5.Caption:= Sitema.RetornaCaminhoArquivos(Sitema.IdEmpresa)+'\Batimento-Fase5.txt';

end;

end.

