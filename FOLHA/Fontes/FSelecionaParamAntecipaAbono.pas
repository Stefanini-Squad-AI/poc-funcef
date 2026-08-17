unit FSelecionaParamAntecipaAbono;

// Alterações:
//***************************************************************************************************
//Nº SIG.....: 26633
//Data.......: 13/04/2017
//Responsável: Andre Imakawa
//Descrição..: Criação do Form
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CheckLst, ComCtrls, Db, DBTables, Wwquery,
  UFuncoesFolha, dBaseDados, uMensErro;

type
  TfrmSelecionaParamAntecipaAbono = class(TfrmOkCancelar)
    pgcPatroPrevBenef: TPageControl;
    TabSheetOpcoes: TTabSheet;
    TabSheetResultado: TTabSheet;
    pnlcheck: TPanel;
    chkSelTodos: TCheckBox;
    PnlPatroPlano: TPanel;
    LblPatro: TLabel;
    Splitter2: TSplitter;
    PnlPlano: TPanel;
    chklstPlano: TCheckListBox;
    PnlPlanodesc: TPanel;
    imgSelPlano: TImage;
    PnlPatrocinadora: TPanel;
    chklstPatro: TCheckListBox;
    PnlPatrocinadoradesc: TPanel;
    imgSelPatro: TImage;
    Splitter1: TSplitter;
    PnlBeneficio: TPanel;
    chklstBenef: TCheckListBox;
    PnlBeneficiodesc: TPanel;
    imgSelBenef: TImage;
    PnlResult: TPanel;
    memResult: TMemo;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryBenef: TwwQuery;
    qryInsertReplicacao: TwwQuery;
    qryUpdateReplicacao: TwwQuery;

    procedure MontaListaPatro;
    procedure MontaListaPlano;
    procedure MontaListaBenef;
    procedure FormCreate(Sender: TObject);
    procedure MontaFiltroInterno(ChkList : TCheckListBox; ListaAux : tstrings;
              var StrLista : string);
    procedure DeterminaPatroSel;
    procedure DeterminaPlanoSel;
    procedure DeterminaBenefSel;
    procedure FormShow(Sender: TObject);
    procedure HabilitaBotaoProcessar;
    procedure chkSelTodosClick(Sender: TObject);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure chklstPlanoClickCheck(Sender: TObject);
    procedure chklstBenefClickCheck(Sender: TObject);
    procedure imgSelPatroClick(Sender: TObject);
    procedure imgSelPlanoClick(Sender: TObject);
    procedure imgSelBenefClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
    ListaBenef,
    ListaPlano,
    ListaPatro,
    ListaPatroXBenef,
    ListaPlanoXBenef,
    ListaExisteParamAbono: TStringList;

    FiRegra: Integer;
    FiPercentual: Integer;
    FsAno: String;
    FsMes: String;

    sPatroSel,
    sPlanoSel,
    sBenefSel : string;

    procedure SetiRegra(const Value: Integer);
    procedure SetiPercentual(const Value: Integer);
    procedure SetsAno(const Value: String);
    procedure SetsMes(const Value: String);
    procedure LimpaParametros(const qry: TwwQuery);
    procedure Processa(var  pTotalInsere, pTotalAtualiza: Integer);
    procedure MontaResultado(sDataInicio, sDataTermino, sTotalInsere, sTotalAtualiza: String);
    procedure SelecionarTodos(bsel: boolean);
    procedure SetHorizontalScrollBar(lb : TCheckListBox) ;
    
  public
    { Public declarations }

    property iRegra: Integer read FiRegra write SetiRegra;
    property iPercentual: Integer read FiPercentual write SetiPercentual;
    property sAno  : String read FsAno write SetsAno;
    property sMes : String read FsMes write SetsMes;
  end;

var
  frmSelecionaParamAntecipaAbono: TfrmSelecionaParamAntecipaAbono;

implementation

{$R *.DFM}



procedure TfrmSelecionaParamAntecipaAbono.FormCreate(Sender: TObject);
begin
  inherited;
  ListaPatro:=TStringList.Create;
  ListaPlano:=TStringList.Create;
  ListaBenef:=TStringList.Create;
  ListaPatroXBenef := TStringList.Create;
  ListaPlanoXBenef := TStringList.Create;
  ListaExisteParamAbono := TStringList.Create;

  qryPatro.Close;
  qryPatro.Open;

  pgcPatroPrevBenef.ActivePage := TabSheetOpcoes;
end;

procedure TfrmSelecionaParamAntecipaAbono.MontaFiltroInterno(ChkList: TCheckListBox;
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

procedure TfrmSelecionaParamAntecipaAbono.DeterminaBenefSel;
begin
  MontaFiltroInterno(chklstBenef, ListaBenef, sBenefSel);
end;

procedure TfrmSelecionaParamAntecipaAbono.DeterminaPatroSel;
begin
  MontaFiltroInterno(chklstPatro, ListaPatro, sPatroSel);
end;

procedure TfrmSelecionaParamAntecipaAbono.DeterminaPlanoSel;
begin
  MontaFiltroInterno(chklstPlano, ListaPlano, sPlanoSel);
end;

procedure TfrmSelecionaParamAntecipaAbono.FormShow(Sender: TObject);
begin
  inherited;
  MontaListaPatro;
  HabilitaBotaoProcessar;
end;

procedure TfrmSelecionaParamAntecipaAbono.HabilitaBotaoProcessar;
var
   bHabilita, bListaIndividual : boolean;
begin
  DeterminaPatroSel;
  DeterminaPlanoSel;
  DeterminaBenefSel;

  // verifica as condições para liberar o botão processar sem o lista individual
  bHabilita := (sPatroSel <> '') and (sPlanoSel <> '') and
               (sBenefSel <> '');


  bbtnConfirmar.Enabled := bHabilita;
end;

procedure TfrmSelecionaParamAntecipaAbono.chkSelTodosClick(Sender: TObject);
begin
  inherited;
  SelecionarTodos(chkSelTodos.Checked);

end;

procedure TfrmSelecionaParamAntecipaAbono.MontaListaPatro;
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

procedure TfrmSelecionaParamAntecipaAbono.MontaListaPlano;
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

procedure TfrmSelecionaParamAntecipaAbono.MontaListaBenef;
var
  sSQL, sLinha : string;
begin
  DeterminaPatroSel;
  DeterminaPlanoSel;

  chklstBenef.Items.Clear;
  ListaBenef.Clear;
  ListaPlanoXBenef.Clear;
  ListaPatroXBenef.Clear;
  ListaExisteParamAbono.Clear;

  if (sPatroSel <> '') and (sPlanoSel <> '') then
  begin
    sSQL := ' SELECT b.nome as beneficio, ' +
            '        pp.nome as plano, ' +
            '        p.nome as patrocinadora, ' +
            '        b.idbeneficio, ' +
            '        bpp.idplanoprev, ' +
            '        ppt.idpessjur,' +
            '(SELECT COUNT(1) FROM  paramantecipabono  paa where paa.idpessjur = ppt.idpessjur' +
            '                    and paa.idplanoprev = bpp.idplanoprev' +
            '                    and paa.idbeneficio = b.idbeneficio' +
            '                    and paa.mes = '+ QuotedStr( sAno + '/' + sMes) +') existe ' +
            '  FROM beneficio b ' +
            '  JOIN benefplanprev bpp ON b.idbeneficio = bpp.idbeneficio ' +
            '  JOIN Planprevpatro ppt ON ppt.idplanoprev = bpp.idplanoprev ' +
            '  JOIN planprev pp ON bpp.idplanoprev = pp.idplanoprev ' +
            '  JOIN pessoa p ON ppt.idpessjur = p.idpessoa ' +
            ' WHERE bpp.idplanoprev IN (' + sPlanoSel + ') ' +
            '   AND ppt.idPessjur IN (' + sPatroSel + ') ';

   

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
         ListaExisteParamAbono.Add(qryBenef.FieldByName('EXISTE').AsString);

         qryBenef.Next;
    end;

    SetHorizontalScrollBar(chklstBenef) ;
  end;
end;
procedure TfrmSelecionaParamAntecipaAbono.chklstPatroClickCheck(
  Sender: TObject);
begin
  inherited;
  MontaListaPlano;
  MontaListaBenef;
  HabilitaBotaoProcessar;
end;

procedure TfrmSelecionaParamAntecipaAbono.chklstPlanoClickCheck(
  Sender: TObject);
begin
  inherited;
  MontaListaBenef;
  HabilitaBotaoProcessar;
end;

procedure TfrmSelecionaParamAntecipaAbono.chklstBenefClickCheck(
  Sender: TObject);
begin
  inherited;
  HabilitaBotaoProcessar;
end;

procedure TfrmSelecionaParamAntecipaAbono.imgSelPatroClick(
  Sender: TObject);
var i : integer;
begin
  inherited;
  for i:=0 to chklstPatro.Items.Count-1 do
  begin
    if PnlPatrocinadoraDesc.BevelInner = bvRaised then
      chklstPatro.Checked[i]:=True
    else
      chklstPatro.Checked[i]:=False;
  end;

  if PnlPatrocinadoraDesc.BevelInner = bvRaised then
    PnlPatrocinadoraDesc.BevelInner:=bvLowered
  else
    PnlPatrocinadoraDesc.BevelInner:=bvRaised;

  chklstPatroClickCheck(Self);
end;

procedure TfrmSelecionaParamAntecipaAbono.imgSelPlanoClick(
  Sender: TObject);
var i : integer;
begin
  inherited;
  for i:=0 to chklstPlano.Items.Count-1 do
  begin
    if PnlPlanoDesc.BevelInner = bvRaised then
      chklstPlano.Checked[i]:=True
    else
      chklstPlano.Checked[i]:=False;
  end;

  if PnlPlanoDesc.BevelInner = bvRaised then
    PnlPlanoDesc.BevelInner:=bvLowered
  else
    PnlPlanoDesc.BevelInner:=bvRaised;

  chklstPlanoClickCheck(Self);
end;

procedure TfrmSelecionaParamAntecipaAbono.imgSelBenefClick(
  Sender: TObject);
var i : integer;  
begin
  inherited;
  for i:=0 to chklstbenef.Items.Count-1 do
  begin
    if PnlBeneficioDesc.BevelInner = bvRaised then
      chklstBenef.Checked[i]:=True
    else
      chklstBenef.Checked[i]:=False;
  end;

  if PnlBeneficioDesc.BevelInner = bvRaised then
    PnlBeneficioDesc.BevelInner:=bvLowered
  else
    PnlBeneficioDesc.BevelInner:=bvRaised;

  HabilitaBotaoProcessar;
end;

procedure TfrmSelecionaParamAntecipaAbono.SetiRegra(
  const Value: Integer);
begin
  FiRegra := Value;
end;

procedure TfrmSelecionaParamAntecipaAbono.SetiPercentual(
  const Value: Integer);
begin
  FiPercentual := Value;
end;

procedure TfrmSelecionaParamAntecipaAbono.SetsAno(const Value: String);
begin
  FsAno := Value;
end;

procedure TfrmSelecionaParamAntecipaAbono.SetsMes(const Value: String);
begin
  FsMes := Value;
end;

procedure TfrmSelecionaParamAntecipaAbono.LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do
   begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;

procedure TfrmSelecionaParamAntecipaAbono.Processa(var pTotalInsere, pTotalAtualiza : Integer);
var
   c, iErroInsere, iErroAtualiza: integer;
begin
  try
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.StartTransaction;

    pTotalInsere := 0;
    pTotalAtualiza := 0;
    iErroInsere  := 0;
    iErroAtualiza  := 0;

    for c := 0 to chklstBenef.Items.Count - 1 do
    begin
      if chklstBenef.Checked[c] then
      Begin


        if ListaExisteParamAbono.Strings[c] = '0' then
        begin
          pTotalInsere := pTotalInsere + 1 ;

          If iRegra <> 0 Then
          Begin
            LimpaParametros(qryInsertReplicacao);
            qryInsertReplicacao.ParamByName('PMES').AsString          := sAno + '/' + sMes;
            qryInsertReplicacao.ParamByName('PIDPESSJUR').AsInteger   := StrToInt(ListaPatroXBenef.Strings[c]);
            qryInsertReplicacao.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(ListaPlanoXBenef.Strings[c]);
            qryInsertReplicacao.ParamByName('PIDBENEFICIO').AsInteger := StrToInt(ListaBenef.Strings[c]);
            qryInsertReplicacao.ParamByName('PIDREGRA').AsInteger     := iRegra;
            qryInsertReplicacao.ParamByName('PPERCENTUAL').AsFloat    := iPercentual;
          end
          Else
          Begin
            LimpaParametros(qryInsertReplicacao);
            qryInsertReplicacao.ParamByName('PMES').AsString          := sAno + '/' + sMes;
            qryInsertReplicacao.ParamByName('PIDPESSJUR').AsInteger   := StrToInt(ListaPatroXBenef.Strings[c]);
            qryInsertReplicacao.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(ListaPlanoXBenef.Strings[c]);
            qryInsertReplicacao.ParamByName('PIDBENEFICIO').AsInteger := StrToInt(ListaBenef.Strings[c]);
            qryInsertReplicacao.ParamByName('PIDREGRA').IsNull;
            qryInsertReplicacao.ParamByName('PPERCENTUAL').AsFloat    := iPercentual;
          End;
          Try
            qryInsertReplicacao.ExecSql;
          Except
            on E:Exception do
            iErroInsere := iErroInsere + 1 ;
          End;

        End
        Else
        begin
          pTotalAtualiza := pTotalAtualiza + 1 ;

          If iRegra <> 0 Then
          Begin
            LimpaParametros(qryUpdateReplicacao);
            qryUpdateReplicacao.ParamByName('PMES').AsString          := sAno + '/' + sMes;
            qryUpdateReplicacao.ParamByName('PIDPESSJUR').AsInteger   := StrToInt(ListaPatroXBenef.Strings[c]);
            qryUpdateReplicacao.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(ListaPlanoXBenef.Strings[c]);
            qryUpdateReplicacao.ParamByName('PIDBENEFICIO').AsInteger := StrToInt(ListaBenef.Strings[c]);
            qryUpdateReplicacao.ParamByName('PIDREGRA').AsInteger     := iRegra;
            qryUpdateReplicacao.ParamByName('PPERCENTUAL').AsFloat    := iPercentual;
          end
          Else
          Begin
            LimpaParametros(qryUpdateReplicacao);
            qryUpdateReplicacao.ParamByName('PMES').AsString          := sAno + '/' + sMes;
            qryUpdateReplicacao.ParamByName('PIDPESSJUR').AsInteger   := StrToInt(ListaPatroXBenef.Strings[c]);
            qryUpdateReplicacao.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(ListaPlanoXBenef.Strings[c]);
            qryUpdateReplicacao.ParamByName('PIDBENEFICIO').AsInteger := StrToInt(ListaBenef.Strings[c]);
            qryUpdateReplicacao.ParamByName('PIDREGRA').IsNull;
            qryUpdateReplicacao.ParamByName('PPERCENTUAL').AsFloat    := iPercentual;
          End;
          Try
            qryUpdateReplicacao.ExecSql;
          Except
            on E:Exception do
            iErroAtualiza := iErroAtualiza + 1 ;
          End;
        end;

      end;

    end;

    dtmBaseDados.dbBaseDados.Commit;

    pTotalInsere := pTotalInsere - iErroInsere;
    pTotalAtualiza := pTotalAtualiza - iErroAtualiza;
  except
    on e : exception do
    begin
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg(e.message, 'Erro', mtError, [mbOk], 0);
    end;
  end;

end;

procedure TfrmSelecionaParamAntecipaAbono.bbtnConfirmarClick(
  Sender: TObject);
Var iTotalInsere, iTotalAtualiza: integer;
    tInicioProcesso, tFimProcesso: tdatetime;
begin
  //inherited;
  tInicioProcesso := Now;
  Processa(iTotalInsere, iTotalAtualiza);
  tFimProcesso    := Now;

  MontaResultado(formatdatetime('dd/mm/yyyy hh:nn:ss', tInicioProcesso), formatdatetime('dd/mm/yyyy hh:nn:ss', tFimProcesso), IntToStr(iTotalInsere), IntToStr(iTotalAtualiza));

  MsgDlg('Parametrização Realizada com Sucesso.','Informação', mtInformation, [mbOk], 0);

  chkSelTodos.checked := False;
  SelecionarTodos(False);

end;

procedure TfrmSelecionaParamAntecipaAbono.MontaResultado(sDataInicio, sDataTermino, sTotalInsere, sTotalAtualiza : String);
Var sBarraH : string;
Begin
  sBarraH := Replicate('-', 120);

  memResult.Lines.Clear;
  memResult.Lines.Add(sBarraH);
  memResult.Lines.Add('Resultado');
  memResult.Lines.Add(sBarraH);

  memResult.Lines.Add(AlinhaEsquerda('Data/Hora Início', 20) + ' | ' +
                          AlinhaEsquerda('Data/Hora Término', 20) + ' | ' +
                          AlinhaEsquerda('Total de Parametrizações Realizadas', 35));


    memResult.Lines.Add(AlinhaEsquerda(sDataInicio, 20) + ' | ' +
                          AlinhaEsquerda(sDataTermino, 20) + ' | ' +
                          sTotalInsere +   ' Inserções / ' +
                          sTotalAtualiza + ' Atualizações');
  memResult.Lines.Add(sBarraH);

  pgcPatroPrevBenef.ActivePage := TabSheetResultado;
end;

procedure TfrmSelecionaParamAntecipaAbono.SelecionarTodos(bSel: Boolean);
var i: Integer;
Begin

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

  PnlPlanoDesc.BevelInner := bvRaised;
  PnlPatrocinadoraDesc.BevelInner := bvRaised;
  PnlBeneficioDesc.BevelInner := bvRaised;

  HabilitaBotaoProcessar;
end;
procedure TfrmSelecionaParamAntecipaAbono.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListaPatro.free;
  ListaPlano.free;
  ListaBenef.free;
  ListaPatroXBenef.free;
  ListaPlanoXBenef.free;
  ListaExisteParamAbono.free;
end;

procedure TfrmSelecionaParamAntecipaAbono.SetHorizontalScrollBar(lb : TCheckListBox) ;

var

  j, MaxWidth: integer;

begin

  MaxWidth := 0;

  for j := 0 to lb.Items.Count - 1 do

  if MaxWidth < lb.Canvas.TextWidth(lb.Items[j]) then

    MaxWidth := lb.Canvas.TextWidth(lb.Items[j]) ;

  SendMessage(lb.Handle, LB_SETHORIZONTALEXTENT,

    MaxWidth + 15, 0) ;

end;
end.

