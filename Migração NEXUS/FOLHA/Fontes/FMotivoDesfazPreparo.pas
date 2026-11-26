{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FMotivoDesfazPreparo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CheckLst, Db, DBTables, Wwquery,UFuncoesFolha;

type
  TfrmMotivoDesfazpreparo = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryBenef: TwwQuery;
    Panel2: TPanel;
    cbxTodos: TCheckBox;
    Panel6: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    chklstPlano: TCheckListBox;
    PnlPlano: TPanel;
    Image2: TImage;
    Panel5: TPanel;
    chklstPatro: TCheckListBox;
    PnlPatrocinadora: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    chklstBenef: TCheckListBox;
    PnlBeneficio: TPanel;
    Image3: TImage;
    chkreferencia: TCheckBox;
    Panel7: TPanel;
    Label2: TLabel;
    mmMotivo: TMemo;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel8: TPanel;
    cboxRetido: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure chklstPlanoClickCheck(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PnlPatrocinadoraClick(Sender: TObject);
    procedure PnlPlanoClick(Sender: TObject);
    procedure PnlBeneficioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure chkreferenciaClick(Sender: TObject);
    procedure cbxTodosClick(Sender: TObject);

  private
    { Private declarations }
    procedure DeterminaPatroSel;
    procedure DeterminaPlanoSel;
    procedure DeterminaBenefSel;
    procedure MontaListaPatro;
    procedure MontaListaPlano;
    procedure MontaListaBenef;
  public
    { Public declarations }
    ListaBenef,
    ListaPlano,
    ListaPatro : TStringList;
    sPatroSel,
    sPlanoSel,
    sBenefSel : string;
    iFundacao : integer;
  end;

var
  frmMotivoDesfazpreparo: TfrmMotivoDesfazpreparo;

implementation

{$R *.DFM}

procedure TfrmMotivoDesfazpreparo.FormShow(Sender: TObject);
begin
  inherited;
  cbxTodos.checked := false;
  qryPatro.params[0].asinteger:=iFundacao;
  qryPatro.open;
  MontaListaPatro;
  MontaListaPlano;
  MontaListaBenef;
end;

procedure TfrmMotivoDesfazpreparo.MontaListaPatro;
begin
  chklstPatro.items.clear;
  ListaPatro.clear;
  while not qryPatro.eof do
  begin
    chklstPatro.items.add(qryPatro.fieldbyname('Nome').asstring);
    ListaPatro.add(qryPatro.fieldbyname('IdPessoa').asstring);
    qryPatro.Next;
  end;
end;

procedure TfrmMotivoDesfazpreparo.MontaListaPlano;
 var i : integer;
     sSQL : string;
begin
  DeterminaPatroSel;

  chklstPlano.items.clear;
  ListaPlano.clear;

  if (sPatroSel <> '') then
  begin
    sSQL:=' SELECT DISTINCT PP.IDPLANOPREV, PP.NOME'+
          ' FROM PLANPREV PP, PLANPREVPATRO PPP'+
          ' WHERE (PPP.IDPESSJUR IN (' + sPatroSel + '))'+
          ' AND (PP.IDPLANOPREV = PPP.IDPLANOPREV)'+
          ' ORDER BY PP.NOME';
  end
  else
    sSQL:=' SELECT IDPLANOPREV, NOME FROM PLANPREV ORDER BY NOME';

  qryPlano.close;
  qryPlano.SQL.Clear;
  qryPlano.SQL.Add(sSQL);
  qryPlano.open;

  while not qryPlano.eof do
  begin
    chklstPlano.items.add(qryPlano.fieldbyname('Nome').asstring);
    ListaPlano.Add(qryPlano.fieldbyname('IdPlanoPrev').asstring);
    qryPlano.Next;
  end;
end;

procedure TfrmMotivoDesfazpreparo.MontaListaBenef;
 var i : integer;
     sSQL : string;
begin
  DeterminaPatroSel;
  DeterminaPlanoSel;

  sSQL:='';
  if (sPatroSel <> '') then
  begin
    if (sPlanoSel <> '') then
    begin
      sSQL:=' SELECT DISTINCT B.IDBENEFICIO, B.NOME, V.FLGREFERENCIA,V.FLGPAGAINSS '+
            ' FROM PLANPREVPATRO P, BENEFPLANPREV V, BENEFICIO B, TPPAGTOBENEFICIO TPB '+
            ' WHERE (P.IDPESSJUR  IN (' + sPatroSel + '))'+
            ' AND (V.IDPLANOPREV IN (' + sPlanoSel + '))'+
            ' AND (V.IDPLANOPREV = P.IDPLANOPREV)'+
            ' AND (B.IDBENEFICIO = V.IDBENEFICIO)'+
            ' AND (TPB.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC)'+
            ' AND (TPB.FLGFREQUENCIA <> ''U'')';
    end
    else
    begin
      sSQL:=' SELECT DISTINCT B.IDBENEFICIO, B.NOME, V.FLGREFERENCIA, V.FLGPAGAINSS '+
            ' FROM PLANPREVPATRO P, BENEFPLANPREV V, BENEFICIO B, TPPAGTOBENEFICIO TPB '+
            ' WHERE (P.IDPESSJUR  IN (' + sPatroSel + '))'+
            ' AND (V.IDPLANOPREV = P.IDPLANOPREV)'+
            ' AND (B.IDBENEFICIO = V.IDBENEFICIO)'+
            ' AND (TPB.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC)'+
            ' AND (TPB.FLGFREQUENCIA <> ''U'')';
    end;
  end
  else
  begin
    if (sPlanoSel <> '') then
    begin
     sSQL:=' SELECT DISTINCT B.IDBENEFICIO, B.NOME'+
           ' FROM BENEFICIO B, BENEFPLANPREV V, TPPAGTOBENEFICIO TPB '+
           ' WHERE (V.IDPLANOPREV IN (' + sPlanoSel + '))'+
           ' AND (B.IDBENEFICIO = V.IDBENEFICIO)'+
           ' AND (TPB.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC)'+
           ' AND (TPB.FLGFREQUENCIA <> ''U'')';
    end
    else
    begin
      sSQL:=' SELECT DISTINCT B.IDBENEFICIO, B.NOME'+
            ' FROM BENEFICIO B, BENEFPLANPREV V, TPPAGTOBENEFICIO TPB '+
            ' WHERE (B.IDBENEFICIO = V.IDBENEFICIO)'+
            ' AND (TPB.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC)'+
            ' AND (TPB.FLGFREQUENCIA <> ''U'')';
    end;
  end;

  if not chkreferencia.Checked then
    sSQL:=sSQL+' AND ((V.FLGREFERENCIA = 0) OR (V.FLGREFERENCIA = 1 AND V.FLGPAGAINSS = 1))';
  sSQL:=sSQL+' ORDER BY B.NOME';

  qryBenef.close;
  qryBenef.SQL.Clear;
  qryBenef.SQL.Add(sSQL);
  qryBenef.open;

  chklstBenef.Items.Clear;
  ListaBenef:=TStringList.Create;

  while not qryBenef.eof do
  begin
    chklstBenef.items.add(qryBenef.fieldbyname('Nome').asstring);
    ListaBenef.Add(qryBenef.fieldbyname('IdBeneficio').asstring);
    qryBenef.Next;
  end;
end;

procedure TfrmMotivoDesfazpreparo.chklstPatroClickCheck(Sender: TObject);
begin
  MontaListaPlano;
  MontaListaBenef;
end;

procedure TfrmMotivoDesfazpreparo.chklstPlanoClickCheck(Sender: TObject);
begin
  MontaListaBenef;
end;

procedure TfrmMotivoDesfazpreparo.DeterminaPatroSel;
begin
  MontaFiltro(chklstPatro, ListaPatro, sPatroSel);
end;

procedure TfrmMotivoDesfazpreparo.DeterminaPlanoSel;
begin
  MontaFiltro(chklstPlano, ListaPlano, sPlanoSel);
end;

procedure TfrmMotivoDesfazpreparo.DeterminaBenefSel;
begin
  MontaFiltro(chklstBenef, ListaBenef, sBenefSel);
end;

procedure TfrmMotivoDesfazpreparo.FormCreate(Sender: TObject);
begin
  inherited;
  ListaPatro:=TStringList.Create;
  ListaPlano:=TStringList.Create;
  ListaBenef:=TStringList.Create;
end;

procedure TfrmMotivoDesfazpreparo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryBenef.close;
  qryPatro.close;
  qryPlano.close;
  ListaPatro.free;
  ListaPlano.free;
  ListaBenef.free;
end;

procedure TfrmMotivoDesfazpreparo.PnlPatrocinadoraClick(Sender: TObject);
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
end;

procedure TfrmMotivoDesfazpreparo.PnlPlanoClick(Sender: TObject);
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
end;

procedure TfrmMotivoDesfazpreparo.PnlBeneficioClick(Sender: TObject);
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
end;

procedure TfrmMotivoDesfazpreparo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   // Carrega as informações
   DeterminaPatroSel;
   DeterminaPlanoSel;
   DeterminaBenefSel;
end;

procedure TfrmMotivoDesfazpreparo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
end;

procedure TfrmMotivoDesfazpreparo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
end;

procedure TfrmMotivoDesfazpreparo.chkreferenciaClick(Sender: TObject);
begin
  inherited;
  MontaListaBenef;
end;

procedure TfrmMotivoDesfazpreparo.cbxTodosClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  // Patrocinadoras
  for i:=0 to chklstPatro.Items.Count-1 do
  begin
    if PnlPatrocinadora.BevelInner = bvRaised then
      chklstPatro.Checked[i]:=True
    else
      chklstPatro.Checked[i]:=False;
  end;

  if PnlPatrocinadora.BevelInner = bvRaised then
  begin
    PnlPatrocinadora.BevelInner:=bvLowered;
    PnlPatrocinadora.enabled := false;
    panel5.enabled := false;
  end else
  begin
    PnlPatrocinadora.enabled := true;
    panel5.enabled := true;
    PnlPatrocinadora.BevelInner:=bvRaised;
  end;

  // Planos
  for i:=0 to chklstPlano.Items.Count-1 do
  begin
    if PnlPlano.BevelInner = bvRaised then
       chklstPlano.Checked[i]:=True
    else
        chklstPlano.Checked[i]:=False;
  end;

  if PnlPlano.BevelInner = bvRaised then
  begin
    PnlPlano.BevelInner:=bvLowered;
    PnlPlano.enabled := false;
    panel4.enabled := false;
  end else
  begin
    PnlPlano.enabled := true;
    panel4.enabled := true;
    PnlPlano.BevelInner:=bvRaised;
  end;

  // Beneficios
  for i:=0 to chklstbenef.Items.Count-1 do
  begin
    if PnlBeneficio.BevelInner = bvRaised then
      chklstBenef.Checked[i]:=True
    else
      chklstBenef.Checked[i]:=False;
  end;

  if PnlBeneficio.BevelInner = bvRaised then
  begin
    PnlBeneficio.BevelInner:=bvLowered;
    PnlBeneficio.enabled := false;
    panel3.enabled := false;
  end else
  begin
    PnlBeneficio.enabled := true;
    panel3.enabled := true;
    PnlBeneficio.BevelInner:=bvRaised;
  end;

end;

end.

{==============================================================================|
| UNIT: FRMMOTIVODESFAZPREPARO                                                 |
| DESCRIÇÃO FUNCIONAL:                                                         |
|  TELA PARA ARMAZENAR O MOTIVO PARA DESFAZER O PREPARO                        |
|==============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/05/2002 A 21/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12T                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CRIAÇÃO DA UNIT,                                                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/02/2003 A 05/02/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| pendencia 10083 - desfazer preparo de retido                                 |
| criar checkbox de opção para desfazer retido.                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/06/2003 A 16/06/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.06B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - MESMO CANCELANDO A OPÇÃO DE DESFAZER PREPARO NA TELA DE MOTIVO, O SISTEMA  |
| CONTINUAVA O PROCESSO DE DESFAZER.                                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/06/2003 A 26/06/2003                         |
| PENDÊNCIA: 14383                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06K                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ABRIR A TELA COM A OPÇÃO DE BENEFICIO DE REFERENCIA MARCADA.               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE   /  /     A   /  /                             |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

