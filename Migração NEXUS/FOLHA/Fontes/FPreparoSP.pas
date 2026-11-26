unit FPreparoSP;

// Alterações:

{-------------------------------------------------------------------------------
Alteração  : Monitoramento
Nº SIG.....: 102321
Data.......: 15/09/2020
Responsável: Andre Imakawa
Descrição..: Criação da propriedade MAQUINA
--------------------------------------------------------------------------------
Rotina     : Monitoramento
Data       : 10/07/2020
SIG        : 100935
Autor      : Andre Imakawa
Descrição  : Tratamento para ALIAS diferente de PRODUCAO.
--------------------------------------------------------------------------------
Rotina     : ValidaAbono
Data       : 20/04/2020
SIG        : 99503
Autor      : Andre Imakawa
Descrição  : Novo argumento para abono FUNCEF ou INSS
--------------------------------------------------------------------------------
Rotina     : Monitoramento                                                                     
Data       : 25/02/2019
SIG        : 82710
Autor      : Andre Imakawa
Descrição  : Monitoramento
--------------------------------------------------------------------------------
Data       : 05/02/2019
SIG        : 81798
Autor      : Andre Imakawa
Descrição  : Recompilação
--------------------------------------------------------------------------------
Autor(a)   : Peterson Victor
Data       : 26/12/2016
Pendência  : SIG 34823
Descricao  : Trava para processar somente uma unica vez
--------------------------------------------------------------------------------

Autor(a)   : Peterson Victor
Data       : 01/02/2016
Pendência  : SOL 268116 PPM 1260538
Descricao  : incluir todos os integrantes do núcleo familiar daquele titular e
             não apenas o beneficiário selecionado na tela de pesquisa
--------------------------------------------------------------------------------
SOL        : 253577/17524
PPM        : 974057
Autor(a)   : Helio Lima Custódio
Data       : 10/07/2015
Descricao  : Incluir FLGCONTRIBDEFICT no insert PREPAROBENEF
Form       : Incluir chkProcessaContribDefict, redimensiona chkSelTodos
             Deixa os campos chkProcessaContrib, chkProcessaContribDefict
             e chkSelTodos Checked := True como default
             Insere o campo FLGCONTRIBDEFICT no SQL da qryInsertPreparoBenef
--------------------------------------------------------------------------------
Pendência  : SOL 229796 PPM 345342
Autor(a)   : Felipe A. Santos
Data       : 23/04/2014
Descricao  : Erro de gravação de parametrizações do preparo por SP (sistema
             estava gravando o IDLISTA incorretamente)
Form       : Correção do IDlista que é passado na tabela preparobenef.
--------------------------------------------------------------------------------
Pendência  : SOL 227251 Kintana 2061942
Autor(a)   : Fernando Xavier
Data       : 11/03/2014
Descricao  : Sistema gera sequencia do idientificador do preparo de forma aleatória.
Form       : Alteração em DFM SQL de insert na tabela PREPAROBENEF
--------------------------------------------------------------------------------
Autor(a)   : William Moreira da Silva
Data       : 05/03/2014
Pendência  : SOL 227250 KTN 2061301
Descricao  : Sistema não apresenta lista individual salva para o usuário autenticado
--------------------------------------------------------------------------------
Autor(a)   : Felipe A. Santos
Data       : 04/12/2013
Pendência  : SOL 208662/15267 Kintana 2049259
Descricao  : Criação da Funcionalidade.
--------------------------------------------------------------------------------
}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, fFrameLista, CheckLst, wwdblook,
  DBCtrls, UFuncoesFolha, Db, DBTables, Wwquery, uMensErro, dBaseDados,
  uSistema,
  wwstorep, MontaSelect;

type
  TfrmPreparoSP = class(TfrmOkCancelar)
    pgcOpcoes: TPageControl;
    tbsOpcoes: TTabSheet;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Label1: TLabel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    chklstPlano: TCheckListBox;
    PnlPlano: TPanel;
    imgSelPlano: TImage;
    Panel5: TPanel;
    chklstPatro: TCheckListBox;
    PnlPatrocinadora: TPanel;
    imgSelPatro: TImage;
    Panel3: TPanel;
    chklstBenef: TCheckListBox;
    PnlBeneficio: TPanel;
    imgSelBenef: TImage;
    chkreferencia: TCheckBox;
    Panel8: TPanel;
    cboxIndividual: TCheckBox;
    tbsIndividual: TTabSheet;
    frameBenef: TfrmFrameListaBenef;
    tbsResultado: TTabSheet;
    Panel7: TPanel;
    memResult: TMemo;
    RdgTpFolha: TRadioGroup;
    Panel2: TPanel;
    lblDescLote: TLabel;
    lblMesRef: TLabel;
    lbldtPagamento: TLabel;
    lbldtCriacaoLote: TLabel;
    dbtDescricao: TDBText;
    dbtMesref: TDBText;
    dbtDataPagto: TDBText;
    dbtDatacria: TDBText;
    cmbLote: TwwDBLookupCombo;
    btnProcessar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryBenef: TwwQuery;
    qryCtrlInterface: TwwQuery;
    dsCtrlInterface: TDataSource;
    chkSelTodos: TCheckBox;
    chkProcessaContrib: TCheckBox;
    qryInsertPreparoBenef: TwwQuery;
    qryAux: TwwQuery;
    qryInsertListaBenefPreparo: TwwQuery;
    spPreparo: TwwStoredProc;
    qryPreparoBenef: TwwQuery;
    qryLogPreparo: TwwQuery;
    MSBenef: TMontaSelect;
    chkProcessaContribDefict: TCheckBox;
    pnlAbono: TPanel;
    gbAbono: TGroupBox;
    chkAbonoFuncef: TCheckBox;
    chkAbonoINSS: TCheckBox;
    procedure PnlPatrocinadoraClick(Sender: TObject);
    procedure PnlPlanoClick(Sender: TObject);
    procedure PnlBeneficioClick(Sender: TObject);
    procedure cboxIndividualClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure chklstPlanoClickCheck(Sender: TObject);
    procedure RdgTpFolhaClick(Sender: TObject);
    procedure cmbLoteChange(Sender: TObject);
    procedure chklstBenefClickCheck(Sender: TObject);
    procedure frameBenefbbtnIncluiBenefClick(Sender: TObject);
    procedure frameBenefdsListaDataChange(Sender: TObject; Field: TField);
    procedure chkSelTodosClick(Sender: TObject);
    procedure frameBenefbbtnIncluiListaClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure chkreferenciaClick(Sender: TObject);
  private
    iIdPreparoBenef : integer;

    ListaBenef,
    ListaPlano,
    ListaPatro,
    ListaPatroXBenef,
    ListaPlanoXBenef: TStringList;

    sPatroSel,
    sPlanoSel,
    sBenefSel : string;

    bSelLote : Boolean; //SIG34823 Peterson Victor

    procedure DeterminaPatroSel;
    procedure DeterminaPlanoSel;
    procedure DeterminaBenefSel;
    procedure MontaListaPatro;
    procedure MontaListaPlano;
    procedure MontaListaBenef;

    // foi criado pois a função MontarFiltro da UFuncoesFolha, quando tinha tudo selecionado zerava os ids
    procedure MontaFiltroInterno(ChkList : TCheckListBox; ListaAux : tstrings;
              var StrLista : string);
    procedure CriaQryLote;
    procedure HabilitaBotaoProcessar;
    procedure GravaParametrizacao;
    procedure MontaResultado;

    function RetornaIdPreparoBenef : integer;
    function RetornaIdListaBeneficioPreparo : integer;
    function InserirPreparoBenef : boolean;
    function InserirListaBeneficioPreparo : boolean;
    function ExecutarSP : boolean;
    procedure Monitoramento(pRotina:String; ptipo: Integer; pErro:String=''); // Andre Imakawa - SIG 81948
    function ValidaAbono: Boolean; // Andre Imakawa - SIG 99503
  public
    { Public declarations }
  end;

var
  frmPreparoSP: TfrmPreparoSP;

implementation

uses fAguarde, UAdmPrev, uFuncaoGeral;

{$R *.DFM}

procedure TfrmPreparoSP.PnlPatrocinadoraClick(Sender: TObject);
 var i: integer;
begin
  inherited;
  for i:=0 to chklstPatro.Items.Count-1 do
  begin
    if PnlPatrocinadora.BevelInner = bvRaised then
      chklstPatro.Checked[i]:=True
    else
      chklstPatro.Checked[i]:=False;
  end;

  if PnlPatrocinadora.BevelInner = bvRaised then
    PnlPatrocinadora.BevelInner:=bvLowered
  else
    PnlPatrocinadora.BevelInner:=bvRaised;

  chklstPatroClickCheck(Self);
end;

procedure TfrmPreparoSP.PnlPlanoClick(Sender: TObject);
 var i : integer;
begin
  inherited;

  for i:=0 to chklstPlano.Items.Count-1 do
  begin
    if PnlPlano.BevelInner = bvRaised then
      chklstPlano.Checked[i]:=True
    else
      chklstPlano.Checked[i]:=False;
  end;

  if PnlPlano.BevelInner = bvRaised then
    PnlPlano.BevelInner:=bvLowered
  else
    PnlPlano.BevelInner:=bvRaised;

  chklstPlanoClickCheck(Self);
end;

procedure TfrmPreparoSP.PnlBeneficioClick(Sender: TObject);
 var i : integer;
begin
  inherited;
  for i:=0 to chklstbenef.Items.Count-1 do
  begin
    if PnlBeneficio.BevelInner = bvRaised then
      chklstBenef.Checked[i]:=True
    else
      chklstBenef.Checked[i]:=False;
  end;

  if PnlBeneficio.BevelInner = bvRaised then
    PnlBeneficio.BevelInner:=bvLowered
  else
    PnlBeneficio.BevelInner:=bvRaised;

  HabilitaBotaoProcessar;
end;

procedure TfrmPreparoSP.DeterminaBenefSel;
begin
  MontaFiltroInterno(chklstBenef, ListaBenef, sBenefSel);
end;

procedure TfrmPreparoSP.DeterminaPatroSel;
begin
  MontaFiltroInterno(chklstPatro, ListaPatro, sPatroSel);
end;

procedure TfrmPreparoSP.DeterminaPlanoSel;
begin
  MontaFiltroInterno(chklstPlano, ListaPlano, sPlanoSel);
end;

procedure TfrmPreparoSP.MontaListaBenef;
var
  sSQL, sLinha : string;
begin
  DeterminaPatroSel;
  DeterminaPlanoSel;

  chklstBenef.Items.Clear;
  ListaBenef.Clear;
  ListaPlanoXBenef.Clear;
  ListaPatroXBenef.Clear;

  if (sPatroSel <> '') and (sPlanoSel <> '') then
  begin
    sSQL := ' SELECT b.nome as beneficio, ' +
            '        pp.nome as plano, ' +
            '        p.nome as patrocinadora, ' +
            '        b.idbeneficio, ' +
            '        bpp.idplanoprev, ' +
            '        ppt.idpessjur' +
            '  FROM beneficio b ' +
            '  JOIN benefplanprev bpp ON b.idbeneficio = bpp.idbeneficio ' +
            '  JOIN Planprevpatro ppt ON ppt.idplanoprev = bpp.idplanoprev ' +
            '  JOIN planprev pp ON bpp.idplanoprev = pp.idplanoprev ' +
            '  JOIN pessoa p ON ppt.idpessjur = p.idpessoa ' +
            ' WHERE bpp.idplanoprev IN (' + sPlanoSel + ') ' +
            '   AND ppt.idPessjur IN (' + sPatroSel + ') ';

   if not chkreferencia.Checked then
      sSQL:=sSQL+' AND ((bpp.FLGREFERENCIA = 0) OR (bpp.FLGREFERENCIA = 1 AND bpp.FLGPAGAINSS = 1))';

    sSQL := sSQL + ' ORDER BY b.nome, pp.nome, p.nome';

    qryBenef.Close;
    qryBenef.SQL.Clear;
    qryBenef.SQL.Add(sSQL);
    qryBenef.Open;

    qryBenef.First;
    while not(qryBenef.Eof) do
    begin
         sLinha := AlinhaEsquerda(Trim(qryBenef.FieldByName('BENEFICIO').AsString), 65) +
                   AlinhaEsquerda(Trim(qryBenef.FieldByName('PLANO').AsString), 25) +
                   Trim(qryBenef.FieldBYName('PATROCINADORA').AsString);

         chklstBenef.Items.Add(sLinha);
         ListaBenef.Add(qryBenef.FieldByName('IDBENEFICIO').AsString);
         ListaPlanoXBenef.Add(qryBenef.FieldByName('IDPLANOPREV').AsString);
         ListaPatroXBenef.Add(qryBenef.FieldByName('IDPESSJUR').AsString);

         qryBenef.Next;
    end;
  end;
end;

procedure TfrmPreparoSP.MontaListaPatro;
begin
  qryPatro.First;
  chklstPatro.Items.clear;
  ListaPatro.Clear;
  while not(qryPatro.Eof) do
  begin
       chklstPatro.Items.Add(qryPatro.FieldByName('NOME').AsString);
       ListaPatro.Add(qryPatro.FieldByName('IDPESSOA').AsString);
       qryPatro.Next;
  end;
end;

procedure TfrmPreparoSP.MontaListaPlano;
var
  sSQL : string;
begin
  DeterminaPatroSel; // pega os id das patrocinadoras selecionadas para passar no filtro do plano

  chklstPlano.Items.Clear;
  ListaPlano.Clear;

  if sPatroSel <> '' then
  begin
    sSQL := ' SELECT pp.idplanoprev, pp.nome ' +
            '   FROM Planprev pp ' +
            '  WHERE EXISTS (SELECT 1 ' +
            '                  FROM benefplanprev bpp ' +
            '                 WHERE pp.idplanoprev = bpp.idplanoprev) AND ' +
            '        EXISTS (SELECT 1 ' +
            '                  FROM Planprevpatro ppt ' +
            '                 WHERE ppt.idplanoprev = pp.idplanoprev ' +
            '                   AND ppt.idpessjur IN ( ' + sPatroSel +' )) ' +
            ' ORDER BY pp.NOME';

    qryPlano.Close;
    qryPlano.SQL.Clear;
    qryPlano.SQL.Add(sSQL);
    qryPlano.Open;
    qryPlano.First;
    while not(qryPlano.Eof) do
    begin
         chklstPlano.Items.Add(qryPlano.FieldByName('NOME').AsString);
         ListaPlano.Add(qryPlano.FieldByName('IDPLANOPREV').AsString);
         qryPlano.Next;
    end;
  end;
end;

procedure TfrmPreparoSP.MontaFiltroInterno(ChkList: TCheckListBox;
  ListaAux: tstrings; var StrLista: string);
var i : integer;
begin
  strLista:='';
  for i:=0 to chklist.items.count-1 do
    if chklist.checked[I] then
    begin
      if strLista = '' then
        strLista:=ListaAux[I]
      else
        strLista:=strLista+','+ListaAux[I];
end;

end;

procedure TfrmPreparoSP.cboxIndividualClick(Sender: TObject);
begin
  inherited;
  tbsIndividual.tabvisible:=cboxIndividual.checked;
  HabilitaBotaoProcessar;
end;

procedure TfrmPreparoSP.FormCreate(Sender: TObject);
begin
  inherited;
  ListaPatro:=TStringList.Create;
  ListaPlano:=TStringList.Create;
  ListaBenef:=TStringList.Create;
  ListaPatroXBenef := TStringList.Create;
  ListaPlanoXBenef := TStringList.Create;

  qryPatro.Close;
  qryPatro.Open;

  tbsIndividual.TabVisible := False;
  pgcOpcoes.ActivePage := tbsOpcoes;
  CriaQryLote;
  bSelLote := False; //SIG34823 Peterson Victor
  pnlAbono.Visible := False; // Andre Imakawa - SIG 99503
end;

procedure TfrmPreparoSP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListaPatro.free;
  ListaPlano.free;
  ListaBenef.free;
  ListaPatroXBenef.free;
  ListaPlanoXBenef.free;
end;

procedure TfrmPreparoSP.FormShow(Sender: TObject);
begin
  inherited;
  MontaListaPatro;
  HabilitaBotaoProcessar;
  frameBenef.DefineLista(0);//William Moreira da Silva - SOL 227250 KTN 2061301
  chkSelTodosClick(chkSelTodos); //Helio - SOL Nº 253577/17524 PPM Nº 974057
end;


procedure TfrmPreparoSP.chklstPatroClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaPlano;
  MontaListaBenef;
  HabilitaBotaoProcessar;
end;

procedure TfrmPreparoSP.chklstPlanoClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaBenef;
  HabilitaBotaoProcessar;
end;

procedure TfrmPreparoSP.CriaQryLote;
 var sSQL, sFiltroTipoFolha, sFiltroResgateParcelado: string;
begin
   case rdgTpFolha.ItemIndex of
     0 : begin
         sFiltroTipoFolha  := ' AND FLGTIPOFOLHA = 0';
         sFiltroResgateParcelado := ' AND FLGRESGATEPARCELADO <> 1';
     end;
     1 : begin
         sFiltroTipoFolha  := ' AND FLGTIPOFOLHA IN (0, 3)';
         sFiltroResgateParcelado := ' AND FLGRESGATEPARCELADO <> 1';
     end;
     2 : begin
         sFiltroTipoFolha  := ' AND FLGTIPOFOLHA IN (0, 4)';
         sFiltroResgateParcelado := ' AND FLGRESGATEPARCELADO <> 1';
     end;
     3 : begin
         sFiltroTipoFolha  := ' AND FLGTIPOFOLHA IN (0, 4)';
         sFiltroResgateParcelado := ' AND FLGRESGATEPARCELADO <> 1';
     end;
     4 : begin
         sFiltroTipoFolha  := '';
         sFiltroResgateParcelado := ' AND FLGRESGATEPARCELADO = 1';
     end;
     5 : begin
        sFiltroTipoFolha  := ' AND (FLGTIPOFOLHA IN(0,3,4) OR';
        sFiltroResgateParcelado := ' FLGRESGATEPARCELADO = 1)'
     end;
   end;

   sSQL := 'SELECT IDLOTE,' +
           '       DATAPAGAMENTO,' +
           '       DATAPREPARO,' +
           '       VLRTOTAL,' +
           '       NUMREG,' +
           '       MESREFERENCIA,' +
           '       DESCRICAO,' +
           '       SUBSTR(MESREFERENCIA,6,2)||''/''||SUBSTR(MESREFERENCIA,1,4) AS MESREF ' +
           '  FROM CTRLINTERFACE' +
           ' WHERE NVL(FLGCONCESSAO,0) = 0' +
           '   AND TIPO = ''B'' '+
           '   AND IDPESSOA = 1' +
           '   AND NVL(FLGVOLTATMP,0) = 0' +
           '   AND IDREFERENCIA IS NULL' +
               sFiltroTipoFolha +
               sFiltroResgateParcelado +
           ' ORDER BY MESREFERENCIA DESC, IDLOTE DESC';

   qryCtrlInterface.Close;
   qryCtrlInterface.SQL.Clear;
   qryCtrlInterface.SQL.Add(sSQL);

   try
      qryCtrlInterface.Open;
   except
      on e: EDBEngineError do
        MostrarErro(E);
   end;
end;

procedure TfrmPreparoSP.RdgTpFolhaClick(Sender: TObject);
begin
  inherited;
  CriaQryLote;
  // Andre Imakawa - SIG 99503 - Inicio
  if RdgTpFolha.ItemIndex = 1 then
    pnlAbono.Visible := True
  else
    pnlAbono.Visible := False;
  // Andre Imakawa - SIG 99503 - Fim
end;

procedure TfrmPreparoSP.cmbLoteChange(Sender: TObject);
begin
  inherited;

  if Trim(cmbLote.Text) <> '' then
  begin
       dbtDescricao.DataSource := dsCtrlInterface;
       dbtMesref.DataSource := dsCtrlInterface;
       dbtDataPagto.DataSource := dsCtrlInterface;
       dbtDatacria.DataSource := dsCtrlInterface;
       bSelLote := True; //SIG34823 Peterson Victor
  end
  else
  begin
      dbtDescricao.DataSource := nil;
      dbtMesref.DataSource := nil;
      dbtDataPagto.DataSource := nil;
      dbtDatacria.DataSource := nil;
      bSelLote := False; //SIG34823 Peterson Victor
  end;

  HabilitaBotaoProcessar;
end;

procedure TfrmPreparoSP.HabilitaBotaoProcessar;
var
   bHabilita, bListaIndividual : boolean;
begin
   DeterminaPatroSel;
   DeterminaPlanoSel;
   DeterminaBenefSel;

   if cboxIndividual.Checked then
   begin
      // verifica se tem algo na lista individual
      if not(frameBenef.qryLista.Active) then
         bListaIndividual := False
      else
         bListaIndividual := (frameBenef.qryLista.RecordCount > 0);

      // verifica as condições para liberar o botão processar
      bHabilita := (sPatroSel <> '') and (sPlanoSel <> '') and
                   (sBenefSel <> '') and (Trim(cmbLote.Text) <> '') and
                   (bListaIndividual)
   end
   else
   begin
      // verifica as condições para liberar o botão processar sem o lista individual
      bHabilita := (sPatroSel <> '') and (sPlanoSel <> '') and
                   (sBenefSel <> '') and (Trim(cmbLote.Text) <> '');
   end;

   btnProcessar.Enabled := bHabilita;
end;

procedure TfrmPreparoSP.chklstBenefClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBotaoProcessar;
end;

procedure TfrmPreparoSP.frameBenefbbtnIncluiBenefClick(Sender: TObject);
begin
  inherited;
  // SOL268116 PPM1260538 Peterson Victor - Inicio
  {
  MSBenef.Executar;
  if (MSBenef.ValoresChave.Count > 0) and
     (MSBenef.ValoresChave[0] <> '') then
  begin
    FrameBenef.ProcessoLista:=false;
    FrameBenef.IncluiPessoaLista(strtoint(MSBenef.ValoresChave[5]),
      strtoint(MSBenef.ValoresChave[0]));
  end;
  }

  frameBenef.bbtnIncluiBenefClick(Sender);

  // SOL268116 PPM1260538 Peterson Victor - Fim

end;

procedure TfrmPreparoSP.frameBenefdsListaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  HabilitaBotaoProcessar;
end;

procedure TfrmPreparoSP.chkSelTodosClick(Sender: TObject);
var
   i : integer;
   bSel : boolean;
begin
  inherited;
  bSel := chkSelTodos.Checked;

  for i := 0 to chklstPatro.Items.Count - 1 do
      chklstPatro.Checked[i] := bSel;

  MontaListaPlano;

  for i := 0 to chklstPlano.Items.Count - 1 do
      chklstPlano.Checked[i] := bSel;

  MontaListaBenef;

  for i := 0 to chklstBenef.Items.Count - 1 do
      chklstBenef.Checked[i] := bSel;

  chklstPatro.Enabled := not(bSel);
  chklstPlano.Enabled := not(bSel);
  chklstBenef.Enabled := not(bSel);
  imgSelPatro.Enabled := not(bSel);
  imgSelPlano.Enabled := not(bSel);
  imgSelBenef.Enabled := not(bSel);

  PnlPlano.BevelInner := bvRaised;
  PnlPatrocinadora.BevelInner := bvRaised;
  PnlBeneficio.BevelInner := bvRaised;

  HabilitaBotaoProcessar;
end;

procedure TfrmPreparoSP.frameBenefbbtnIncluiListaClick(Sender: TObject);
begin
  inherited;
  frameBenef.bbtnIncluiListaClick(Sender);

end;

procedure TfrmPreparoSP.GravaParametrizacao;
begin
   InserirPreparoBenef;
   InserirListaBeneficioPreparo;
end;

function TfrmPreparoSP.RetornaIdPreparoBenef: integer;
var
   sSQL : string;
begin
   try
      sSQL := 'select cm.seqpreparobenef.nextval as IDPREPAROBENEF from dual ';

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSQL);
      qryAux.Open;

      result := qryAux.FieldByName('IDPREPAROBENEF').AsInteger;
   finally
      qryAux.Close;
   end;
end;

function TfrmPreparoSP.InserirListaBeneficioPreparo: boolean;
var
   c : integer;
begin
  try
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.StartTransaction;

   for c := 0 to chklstBenef.Items.Count - 1 do
   begin
          if chklstBenef.Checked[c] then
          begin
              qryInsertListaBenefPreparo.ParamByName('IDLISTABENEFICIOPREPARO').AsInteger :=RetornaIdListaBeneficioPreparo;
              qryInsertListaBenefPreparo.ParamByName('IDPREPAROBENEF').AsInteger := iIdPreparoBenef;
              qryInsertListaBenefPreparo.ParamByName('IDPATRO').AsString := ListaPatroXBenef.Strings[c];
              qryInsertListaBenefPreparo.ParamByName('IDPLANOPREV').AsString := ListaPlanoXBenef.Strings[c];
              qryInsertListaBenefPreparo.ParamByName('IDBENEFICIO').AsString := ListaBenef.Strings[c];
              qryInsertListaBenefPreparo.ExecSQL;
          end;
   end;

   dtmBaseDados.dbBaseDados.Commit;

   Result := True;

   except
    on e : exception do
    begin
         dtmBaseDados.dbBaseDados.Rollback;
         Result := False;
         MsgDlg(e.message, 'Erro', mtError, [mbOk], 0);
    end;
  end;

end;

function TfrmPreparoSP.InserirPreparoBenef: boolean;
var
   iFlgContribuicao, iFlgPreparoTotal, iTipoPreparo : integer;
   sListaUsuario : string;
begin
  sListaUsuario := ''; // Felipe A. Santos SOL 229796 PPM 345342

  //iIdPreparoBenef := RetornaIdPreparoBenef; // SOL 227251 Kintana 2061942
  if chkProcessaContrib.Checked then
     iFlgContribuicao := 1
  else
     iFlgContribuicao := 0;

  if chkSelTodos.Checked then
     iFlgPreparoTotal := 1
  else
     iFlgPreparoTotal := 0;

  if cboxIndividual.Checked then // Felipe A. Santos SOL 229796 PPM 345342
     sListaUsuario := IntToStr(frameBenef.ListaUsuario);

  if sListaUsuario = '0' then
     sListaUsuario := '';


  iTipoPreparo := RdgTpFolha.ItemIndex + 1;

  // Andre Imakawa - SIG 99503 - Inicio
  if RdgTpFolha.ItemIndex = 1 then
  begin
    if (chkAbonoFuncef.Checked = True) and ( chkAbonoINSS.Checked = True) then
      iTipoPreparo := 2
    else
      if (chkAbonoFuncef.Checked = True) then
        iTipoPreparo := 7
      else
        if (chkAbonoINSS.Checked = True) then
          iTipoPreparo := 8;
  end;
  // Andre Imakawa - SIG 99503 - Fim

  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    qryInsertPreparoBenef.Close;
    qryInsertPreparoBenef.ParamByName('IDPREPAROBENEF').AsInteger := iIdPreparoBenef;//SOL 227251 Kintana 2061942 // Felipe A. Santos Descomentado SOL 229796 PPM 345342
    qryInsertPreparoBenef.ParamByName('IDTIPOPREPAROBENEF').AsInteger := iTipoPreparo;
    qryInsertPreparoBenef.ParamByName('IDLOTE').AsString := qryCtrlInterface.FieldByName('IDLOTE').AsString;
    qryInsertPreparoBenef.ParamByName('IDLISTA').AsString := sListaUsuario;
    qryInsertPreparoBenef.ParamByName('FLGCONTRIBUICAO').AsInteger := iFlgContribuicao;
    qryInsertPreparoBenef.ParamByName('FLGPREPAROTOTAL').AsInteger := iFlgPreparoTotal;
    qryInsertPreparoBenef.ParamByName('DATAINICIO').AsString := '';
    qryInsertPreparoBenef.ParamByName('DATATERMINO').AsString := '';

    //Inicio - Helio - SOL Nº 253577/17524 PPM Nº 974057
    if chkProcessaContribDefict.Checked then
         qryInsertPreparoBenef.ParamByName('FLGCONTRIBDEFICT').AsInteger := 1
    else
         qryInsertPreparoBenef.ParamByName('FLGCONTRIBDEFICT').AsInteger := 0;
    //Fim Helio - SOL Nº 253577/17524 PPM Nº 974057

    qryInsertPreparoBenef.ExecSQL;

    dtmBaseDados.dbBaseDados.Commit;

    //iIdPreparoBenef := RetornaIdPreparoBenef; //SOL 227251 Kintana 2061942 // Felipe A. Santos Comentado SOL 229796 PPM 345342

    Result := True;
  except
    on e : exception do
    begin
      dtmBaseDados.dbBaseDados.Rollback;
      Result := False;
      MsgDlg(e.message, 'Erro', mtError, [mbOk], 0);
    end;
  end;
end;

procedure TfrmPreparoSP.btnProcessarClick(Sender: TObject);
begin
  if bSelLote then    //Peterson Victor SIG34823
  begin
    // Andre Imakawa - SIG 99503 - Inicio
    if not(ValidaAbono) then
      Exit;
    // Andre Imakawa - SIG 99503 - Fim

    try
      Monitoramento('PREPARO',0);
      btnProcessar.Enabled := False; //Peterson Victor SIG34823
      bSelLote := False;  //Peterson Victor SIG34823

      inherited;
      iIdPreparoBenef := RetornaIdPreparoBenef; // Felipe A. Santos

      GravaParametrizacao;
      ExecutarSP;


      //Peterson Victor SIG34823 - Inicio
      dbtDescricao.DataSource := nil;
      dbtMesref.DataSource := nil;
      dbtDataPagto.DataSource := nil;
      dbtDatacria.DataSource := nil;
      cmbLote.Text := '';
      //Peterson Victor SIG34823 - Fim
    finally
      Monitoramento('PREPARO',1);
    end;
  end;

end;

function TfrmPreparoSP.RetornaIdListaBeneficioPreparo: integer;
var
   sSQL : string;
begin
  try
     sSQL := 'SELECT SEQLISTABENEFICIOPREPARO.NEXTVAL AS IDLISTABENEFICIOPREPARO FROM DUAL';

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSQL);
     qryAux.Open;

     Result := qryAux.FieldByName('IDLISTABENEFICIOPREPARO').AsInteger;
  finally
     qryAux.Close;
  end;
end;

function TfrmPreparoSP.ExecutarSP: boolean;
begin
  try
    frmAguarde.Mostra('Processando preparo nº: ' + IntToStr(iIdPreparoBenef));

    spPreparo.ParamByName('IN_IDPREPAROBENEF').AsInteger := iIdPreparoBenef;
    spPreparo.Prepare;
    spPreparo.ExecProc;

    frmAguarde.Apaga;
    MontaResultado;

    Result := True;
  except
   on e : exception do
   begin
        Result := False;
        frmAguarde.Apaga;
        MsgDlg(e.message, 'Erro', mtError, [mbOk], 0);
   end;
  end;
end;

procedure TfrmPreparoSP.MontaResultado;
var
   sSQL,
   sDataInicio,
   sDataTermino,
   sIncidencia,
   sMatricula,
   sBarraH : string;

   iTotalBenef,
   iTotalBenefProc,
   iTotalBenefRej,
   iTipoBeneficio : integer;
   iCont, iInicio, iTamanho, iQuebra, iTotalResult: Integer; // Andre Imakawa - SIG 99503
begin
   try
      qryLogPreparo.Close;
      qryLogPreparo.ParamByName('IDPREPAROBENEF').AsInteger := iIdPreparoBenef;
      qryLogPreparo.Open;

      qryPreparoBenef.Close;
      qryPreparoBenef.ParamByName('IDPREPAROBENEF').AsInteger := iIdPreparoBenef;
      qryPreparoBenef.Open;

      sDataInicio := qryPreparoBenef.FieldByName('DATAINICIO').AsString;
      sDataTermino := qryPreparoBenef.FieldByName('DATATERMINO').AsString;
      iTotalBenef := qryPreparoBenef.FieldByName('TOTALBENEFICIOS').AsInteger;
      iTotalBenefProc := qryPreparoBenef.FieldByName('TOTALBENEFPROC').AsInteger;
      iTotalBenefRej := qryPreparoBenef.FieldByName('TOTALBENEFREJ').AsInteger;

      sBarraH := Replicate('-', 120);

      memResult.Lines.Clear;
      memResult.Lines.Add(sBarraH);
      memResult.Lines.Add('Log de Incidências');
      memResult.Lines.Add(sBarraH);
      memResult.Lines.Add(AlinhaEsquerda('Matrícula', 20) + ' | ' +
                          AlinhaEsquerda('Tipo de Benefício', 20) + ' | ' +
                          AlinhaEsquerda('Incidência', 20));

      qryLogPreparo.First;
      while not(qryLogPreparo.Eof) do
      begin
        iTipoBeneficio := qryLogPreparo.FieldByName('TIPOBENEFICIO').AsInteger;
        sIncidencia := qryLogPreparo.FieldByName('OBSERVACOES').AsString;
        sMatricula := qryLogPreparo.FieldByName('MATRICULA').AsString;

        // Andre Imakawa - SIG 99503 - Inicio
        if Length(sIncidencia) > 70 then
        begin
          iTotalResult := (Length(sIncidencia) div 70);
          iInicio := 1;
          iTamanho := 70;
          
          for iCont:=0 to iTotalResult do
          begin
            iQuebra := Pos(' ', Copy(sIncidencia, iInicio + iTamanho, Length(sIncidencia)- (iInicio + iTamanho)));


            memResult.Lines.Add(IIF(iCont=0,AlinhaEsquerda(sMatricula, 20),AlinhaEsquerda('', 20)) + ' | ' + Replicate(' ', 7) +
                              IIF(iCont=0,AlinhaEsquerda(IntToStr(iTipoBeneficio), 13),AlinhaEsquerda('', 13)) + ' | ' +
                              Copy(sIncidencia, iInicio, StrtoInt(iif(iQuebra>0, IntToStr(iTamanho + iQuebra), IntToStr(Length(sIncidencia)- (iInicio) +1)))));

            iInicio := iInicio + StrtoInt(iif(iQuebra>0, IntToStr(iTamanho + iQuebra), IntToStr(Length(sIncidencia)- (iInicio)+1)));
          end;

        end
        else
        begin
          memResult.Lines.Add(AlinhaEsquerda(sMatricula, 20) + ' | ' + Replicate(' ', 7) +
                              AlinhaEsquerda(IntToStr(iTipoBeneficio), 13) + ' | ' +
                              AlinhaEsquerda(sIncidencia, 20));
        end;
        // Andre Imakawa - SIG 99503 - Fim

        qryLogPreparo.Next;
      end;

      if qryLogPreparo.IsEmpty then
         memResult.Lines.Add(' ');

      memResult.Lines.Add(sBarraH);

      // Resultados
      memResult.Lines.Add(' ');
      memResult.Lines.Add(' ');
      memResult.Lines.Add(' ');
      memResult.Lines.Add(sBarraH);
      memResult.Lines.Add('Resultado');
      memResult.Lines.Add(sBarraH);
      memResult.Lines.Add(AlinhaEsquerda('Data/Hora Início', 20) + ' | ' +
                          AlinhaEsquerda('Data/Hora Término', 20) + ' | ' +
                          AlinhaEsquerda('Total de Benefícios', 20) + ' | ' +
                          AlinhaEsquerda('Benefícios processados', 20) + ' | ' +
                          AlinhaEsquerda('Benefícios não processados', 20));
      memResult.Lines.Add(AlinhaEsquerda(sDataInicio, 20) + ' | ' +
                          AlinhaEsquerda(sDataTermino, 20) + ' | ' + Replicate(' ', 7) +
                          AlinhaEsquerda(IntToStr(iTotalBenef), 13) + ' | ' + Replicate(' ', 9) +
                          AlinhaEsquerda(IntToStr(iTotalBenefProc), 13) + ' | ' + Replicate(' ', 10) +
                          AlinhaEsquerda(IntToStr(iTotalBenefRej), 10));
      memResult.Lines.Add(sBarraH);

      pgcOpcoes.ActivePage := tbsResultado;
   finally
      qryPreparoBenef.Close;
      qryLogPreparo.Close;
   end;
end;

procedure TfrmPreparoSP.chkreferenciaClick(Sender: TObject);
begin
  inherited;
  MontaListaBenef;
  HabilitaBotaoProcessar;

  if chkSelTodos.Checked then
     chkSelTodosClick(Self);
end;

// Andre Imakawa - SIG 81948 - Inicio
procedure TfrmPreparoSP.Monitoramento(pRotina:String; ptipo: Integer; pErro:String='');
var lParams :TStringList;
    lResponse : TStringStream;
    sHeader, sUsuario, sHorario, sErro, sMensagem, sIdExec : string;
    sGrupo, sQuebra: string; // Andre Imakawa - SIG 100935
    dia: TDateTime;
    sMaquina, sRetorno: string; // Andre Imakawa - SIG 102321
begin
  inherited;
  // Andre Imakawa - SIG 100935 - Inicio
  sQuebra := ' \ue008\ue007\ue000';
  
  if Copy(UpperCase(Sistema.AliasServidor),1,8) <> 'PRODUCAO' then
     sGrupo := 'Checklist Sistemas'
  else
    sGrupo := 'Monitoramento';

  // Andre Imakawa - SIG 100935 - Fim
  Try
    try

      case ptipo of
        0: sHeader := ' - INICIO';
        1: sHeader := ' - FIM';
      end;
      sHeader := sHeader + '';

      sUsuario := 'USUARIO: '+Sistema.NomeUsuario;
      sHorario := 'HORARIO: '+ formatdatetime('dd/mm/yyyy hh:nn:ss',now);
      sMaquina := 'MAQUINA: '+ UpperCase(trim(FuncaoGeral.GetNomeComputador)); // Andre Imakawa - SIG 102321
      sErro    := 'MSG: '+pErro;

      lParams := TStringList.Create;
      lResponse := TStringStream.Create('');

      case ptipo of
        0,1: sMensagem := '{"numero":"'+ sGrupo +'","mensagem":"'+ pRotina + sHeader + sQuebra + sUsuario + sQuebra + sHorario + sQuebra + sMaquina +'"}';          // Andre Imakawa - SIG 100935 // Andre Imakawa - SIG 102321
        2:   sMensagem := '{"numero":"'+ sGrupo +'","mensagem":"'+ pRotina + sHeader + sQuebra + sErro + sQuebra + sUsuario + sQuebra + sHorario + sQuebra + sMaquina +'"}';  // Andre Imakawa - SIG 100935 // Andre Imakawa - SIG 102321
      end;

      //FuncaoGeral.EnviaMonitoramento('http://mw.funcef.com.br:5000/api/envia','application/json', sMensagem); // Andre Imakawa - SIG 82710
      FuncaoGeral.RequestAPI('http://mw.funcef.com.br:5000/api/envia', sMensagem, sRetorno, 'application/json',''); // Andre Imakawa - SIG 102321
    Except
      on E: Exception do
      begin
        //memResult.Lines.Add('ERRO INT1-C.'); // Andre Imakawa - SIG 82710
      end;
    end;
  finally
    FreeAndNil(lParams);
    FreeAndNil(lResponse);
  end;
end;
// Andre Imakawa - SIG 81948 - Fim

// Andre Imakawa - SIG 99503 - Inicio
function TfrmPreparoSP.ValidaAbono: Boolean;
begin
  Result := True;
  if rdgTpFolha.ItemIndex = 1 then
  begin
    if (chkAbonoFuncef.Checked = False) and ( chkAbonoINSS.Checked = False) then
    begin
      MsgDlg('Fonte Pagadora do abono deve ser selecionada. ',
            'Atenção', mtInformation, [mbOk, mbHelp], 0);
         Result := False;
    end;
  end;
end;
// Andre Imakawa - SIG 99503 - Fim

end.
