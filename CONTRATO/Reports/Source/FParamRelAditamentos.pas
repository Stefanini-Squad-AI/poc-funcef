unit FParamRelAditamentos;

{-------------------------------------------------------------------------------
Rotina......: criação da tela nova de parametros
N. Sol......: 222290-16959
N. PPM .....: 670297
Data........: 15/02/2012
Responsável.: Edilaine Ferraresi
Melhoria....: contador para total de registros por tipo de aditamento
--------------------------------------------------------------------------------}

interface
                                    
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  ExtCtrls, CheckLst, ComCtrls, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery,
  uSistema, uFuncoesUteis;

type
  TFrmParamRelAditamentos = class(TfrmParamReports_Padrao)
    Label1: TLabel;
    Label2: TLabel;
    pgContrato: TPageControl;
    tsContrato: TTabSheet;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    chklstContratos: TCheckListBox;
    rgTipoContr: TRadioGroup;
    rgTipo: TRadioGroup;
    edDtInicial: TCMDateTimePicker;
    edDtFinal: TCMDateTimePicker;
    qryContratos: TwwQuery;
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure rgTipoContrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    lstIDContrato : TStringList;
  public
    { Public declarations }
  end;

var
  FrmParamRelAditamentos: TFrmParamRelAditamentos;

implementation

{$R *.DFM}



procedure TFrmParamRelAditamentos.bbtnSelTodosClick(Sender: TObject);
var
  c : integer;
begin
  inherited;
  for c:=0 to chklstContratos.Items.Count-1 do
    chklstContratos.Checked[c] := true;
  chklstContratos.Repaint;
end;


procedure TFrmParamRelAditamentos.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstContratos.Items.Count-1 do
    chklstContratos.Checked[c] := not(chklstContratos.Checked[c]);
  chklstContratos.Repaint;
end;


procedure TFrmParamRelAditamentos.rgTipoContrClick(Sender: TObject);
begin
  inherited;

  // lista todos
  qryContratos.close;
  qryContratos.SQL.clear;
  qryContratos.SQL.Add('SELECT CC.IDCONTRATO, CC.NOMECONTRATO ');
  qryContratos.SQL.Add('  FROM CONTRATOCONTR CC, CONTRATOUSUARIO CXU ');
  qryContratos.SQL.Add(' WHERE CC.IDCONTRATO = CXU.IDCONTRATO        ');
  qryContratos.SQL.Add('   AND CXU.IDUSUARIO = '+IntToStr(Sistema.IdUsuario) );
  {RNG05 - a grid identificada pelo nome "Contrato" irá exibir apenas os contratos previamente filtrados e vinculados ao usuario *}
  case rgTipoContr.itemIndex  of
     0 : qryContratos.SQL.Add('   AND CC.FLGFIMCONTRATO <> ''E'' ');  {*Vigentes*}
     1 : qryContratos.SQL.Add('   AND CC.FLGFIMCONTRATO = ''E'' ');   {*Encerrados*}
  end;
  qryContratos.SQL.Add('ORDER BY CC.NOMECONTRATO');
  qryContratos.Open;
  
  // preenche lista com contratos
  lstIDContrato.Clear;
  chklstContratos.Clear;
  while not qryContratos.eof do
  begin
    chklstContratos.Items.Add( qryContratos.FieldByName('NOMECONTRATO').AsString );
    lstIDContrato.Add( qryContratos.FieldByName('IDCONTRATO').AsString );
    qryContratos.next;
  end;
end;


procedure TFrmParamRelAditamentos.FormCreate(Sender: TObject);
begin
  inherited;

  lstIDContrato := TStringList.create;

  rgTipoContrClick(rgTipoContr);
end;


procedure TFrmParamRelAditamentos.bbtnConfirmarClick(Sender: TObject);
Var
  sListaContr : string;
  wNum : word;
begin
  inherited;
  {* Lista de Contratos selecionados *}
  wNum := CriaListaOpcoes(chklstContratos, lstIdContrato, sListaContr, ',', false);
  if (wNum = lstIdContrato.Count) then
    sListaContr := '';

  {* passando parametros *}
  Cmp_Padrao.ParamByName('Contratos').AsString  := sListaContr;
  Cmp_Padrao.ParamByName('DtIni').AsString      := edDtInicial.text;
  Cmp_Padrao.ParamByName('DtFim').AsString      := edDtFinal.text;
  Cmp_Padrao.ParamByName('Tipo').AsString       := iff( rgTipo.itemIndex = 0, 'A', iff( rgTipo.ItemIndex = 1, 'C', ''));
  Cmp_Padrao.ParamByName('TipoContr').AsInteger := rgTipoContr.itemIndex;

end;


procedure TFrmParamRelAditamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(lstIDContrato);
  inherited;
end;

end.
