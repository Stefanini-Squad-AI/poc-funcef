unit FAltAditamentoMT;
{-------------------------------------------------------------------------------   
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N.WO............: WO20776
Data............: 29/04/2025
Responsável.....: Paulo Nobre
Descrição.......: Ajustes no layout da grid e ordenação de campos
--------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 05/12/2024
Responsável.....: Paulo Nobre
Descrição.......: Implemento recurso para identificar na grid qual o aditamento
                  não teve as parcelas reiniciadas (FLGREINICIODASPARCELAS).   
--------------------------------------------------------------------------------
N. SIG..........: 88476
Data............: 11/11/2020
Responsável.....: Ewerton Beltramini
Descrição.......: Habilitado o botão Excluir. Criação de tela para a realização
                  da exclusão (frmCadAditamentoMTDel ).
--------------------------------------------------------------------------------
N. SIG..........: 96771
Data............: 18/03/2020
Responsável.....: Rafael Vasconcelos
Descrição.......: Trazer contratos mesmo que não tenham produtoxitem para altera o aditamento.
--------------------------------------------------------------------------------
Rotina..........: CmeCadastroEdit
N. SIG..........: 81261
Data............: 17/10/2019
Responsável.....: Fábio Sampaio
Descrição.......: Ajuste para não gerar o aditamento na alteração.
--------------------------------------------------------------------------------
Rotina..........: FCadAditamentoMT
N. SIG..........: 49065
Data............: 04/12/2017
Responsável.....: Osni/Darivaldo Alencar
Descrição.......: Erro ao fazer reinicio das parcelas.
--------------------------------------------------------------------------------
Rotina..........: frmAltAditamento
N. Sol..........: 120378
N. Kintana......: 575744
Data............: 08/12/2009
Responsável.....: Marilza Colpani
Descrição.......: Criação de um novo formulario.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, DBCtrls, CMProcuraSubTipo, TREdit, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, ComCtrls, Mask, wwdbedit, uCtrlUsuXContrato,
  uCtrlContratos, uCtrlListTercContratos, uCtrlResponsavel, uCtrlAditamento,
  uCtrlServProdxItemContr, uCtrlOrcamento, uCtrlParamIntegra, uCmSqlParams,
  uCtrlParamAditamento, FEncrerraContratoMT, FCadAditamentoMT, uCMTypes,
  DBTables, FCadAditamentoMTDel,
  uCtrlCtrlParcelaMedicao, Wwquery;   //Osni Cavalcante - SIG49065


type
  TfrmAltAditamentoMT = class(TFrmCadastroMT)
    PnlPrincipal: TPanel;
    Label16: TLabel;
    Label20: TLabel;
    dbeNomeContrato: TwwDBEdit;
    dbeNumeroProcesso: TwwDBEdit;
    cdsAditamento: TCMClientDataSet;
    edtServicoProduto: TwwDBEdit;
    edtItem: TwwDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    dsAditamento: TDataSource;
    cdsLogAditamento: TCMClientDataSet;
    sqlAditamentos: TCMSqlParams;
    cdsAditamentoFLGREINICIODASPARCELAS: TStringField;
    cdsAditamentoDATAASSADITAMENTO: TDateTimeField;
    cdsAditamentoDESCADITAMENTO: TMemoField;
    cdsAditamentoCODADITAMENTO: TStringField;
    cdsAditamentoIDCONTRATO: TFloatField;
    cdsAditamentoIDADITAMENTO: TFloatField;
    cdsAditamentoFLGVIRTUAL: TStringField;
    cdsAditamentoIDPROCESSO: TFloatField;
    cdsAditamentoFLGTIPO: TStringField;
    cdsAditamentoNUMRAD: TFloatField;
    cdsAditamentoFLGRESTAURADO: TFloatField;
    cdsAditamentoVL_ADITAMENTO: TFloatField;
    cdsAditamentoFLGSALDOTRANSFERIDO: TStringField;
    cdsAditamentoID_TEMP: TFloatField;
    qryAux: TwwQuery;
    dbgGrd: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbgGrdDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
    CtrlContratos          : TCtrlContratos;
    CtrlAditamento         : TCtrlAditamento;
    //Osni Cavalcante/Darivaldo Alencar - SIG  49065 -inicio
    cdsCtrlParcelaMedicao: TCMClientDataSet;
    cdsServProdxItemContr: TCMClientDataSet;
    CtrlCtrlParcelaMedicao : TCtrlCtrlParcelaMedicao;
    CtrlServProdxItemContr : TCtrlServProdxItemContr;
    procedure CarregaContrato(const iContrato: Double);
    //Osni Cavalcante/Darivaldo Alencar - SIG  49065 -fim

  public
    { Public declarations }
  end;

var
  frmAltAditamentoMT: TfrmAltAditamentoMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, FAditamentosNaoAprovadosMT,
  RAditamentos;

procedure TfrmAltAditamentoMT.FormCreate(Sender: TObject);
begin
   inherited;

   //Inicializa Controls
   CtrlContratos := TCtrlContratos.Create(Sistema.IdEmpresa, Sistema.IdUsuario);
   CtrlContratos.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlContratos.CdsContratoContr := Cds;
   CtrlContratos.CdsAditamento    := cdsAditamento;

   CtrlAditamento := TCtrlAditamento.Create;
   CtrlAditamento.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlAditamento.CdsAditamento := cdsAditamento;
   CtrlAditamento.CdsLogAditamento := cdsLogAditamento;

   Cds.Data := CtrlContratos.ListContratoAditamento(-1); //Vazio
   cdsAditamento.Data := CtrlAditamento.ListAditamento(-1,-1); //Vazio
   cdsLogAditamento.Data := CtrlAditamento.ListLogAditamento( -1 );

   //Osni Cavalcante/Darivaldo Alencar - SIG49065
   CtrlCtrlParcelaMedicao := TCtrlCtrlParcelaMedicao.Create;
   CtrlCtrlParcelaMedicao.Initialize(dtmBaseDados.dbBaseDados,True);
   cdsCtrlParcelaMedicao:= TCMClientDataSet.create(nil);
   cdsCtrlParcelaMedicao.Data := CtrlCtrlParcelaMedicao.ListCtrlParcelaMedicao(-1);

   CtrlServProdxItemContr := TCtrlServProdxItemContr.Create;
   CtrlServProdxItemContr.Initialize(dtmBaseDados.dbBaseDados,True);

   cdsServProdxItemContr  := TCMClientDataSet.create(nil);
   cdsServProdxItemContr.Data := CtrlServProdxItemContr.ListProdServXItem(-1,-1,-1,False); //Vazio
   TFloatField(cdsServProdxItemContr.FieldByName('VALORUNITARIOOBJETO')).DisplayFormat:='#,##0.00';
   TFloatField(cdsServProdxItemContr.FieldByName('VALORTOTALOBJETO')).DisplayFormat:='#,##0.00';

   CtrlAditamento.CdsCtrlParcelaMedicao := cdsCtrlParcelaMedicao; 
   //Osni Cavalcante/Darivaldo Alencar - SIG49065

   sqlAditamentos.Open  // Paulo Nobre -  WO15750
end;

procedure TfrmAltAditamentoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlContratos.Free;
   CtrlAditamento.Free;

   //Darivaldo Alencar SIG49065
   FreeAndNil(CtrlCtrlParcelaMedicao);
   FreeAndNil(CtrlServProdxItemContr);
   FreeAndNil(cdsCtrlParcelaMedicao);
   FreeAndNil(cdsServProdxItemContr);
   //Darivaldo Alencar SIG49065
   
   inherited;
end;

procedure TfrmAltAditamentoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    Cds.Data := CtrlContratos.ListContratoAditamento(StrToFloat(MontaSelect.ValoresChave[0])); //Vazio
    cdsAditamento.Data := CtrlAditamento.ListAditamento(0,
      StrToFloat(MontaSelect.ValoresChave[0]),'');
      
    CarregaContrato(StrToFloat(MontaSelect.ValoresChave[0]));//Darivaldo Alencar SIG49065  
  end;
end;

procedure TfrmAltAditamentoMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
//  inherited;
  pnlFundo.Enabled := True;
  dbgGrd.Enabled := True;
end;

procedure TfrmAltAditamentoMT.CmeCadastroEdit(Sender: TObject);
var
  frmAux : TfrmCadAditamentoMT;
begin
  frmAux := TfrmCadAditamentoMT.Create(Self);
  try
    //cdsAditamento.EmptyDataSet;
    frmAux.cdsAditamento.Data := CtrlAditamento.ListAditamento(
      cdsAditamento.FieldByName( 'IDADITAMENTO' ).AsFloat,
      cdsAditamento.FieldByName( 'IDCONTRATO' ).AsFloat );
    frmAux.cdsAditamento.Edit;
    frmAux.cdsAditamento.FieldByName( 'ID_TEMP' ).Value := '1';
    frmAux.cdsAditamento.Post;
    cdsLogAditamento.Data := CtrlAditamento.ListLogAditamento(
      cdsAditamento.FieldByName( 'IDADITAMENTO' ).AsFloat );
    //frmAux.rIdContrato := Cds.FieldByName('IDCONTRATO').AsFloat; SIG 96771
    frmAux.rIdContrato := cdsAditamento.FieldByName( 'IDCONTRATO' ).AsFloat; //SIG 96771
    frmAux.rIdCorrecao := 1;
    
    //Osni cavalcante/Darivaldo Alencar - SIG49065 - Início
    CarregaContrato(cdsAditamento.FieldByName( 'IDCONTRATO' ).AsFloat);
    cdsCtrlParcelaMedicao.EmptyDataSet;
    frmAux.cdsCtrlParcelaMedicao.Data := cdsCtrlParcelaMedicao.Data;
    frmAux.cdsServProdXItemContr.Data := cdsServProdxItemContr.Data;
    //Osni cavalcante/Darivaldo Alencar - SIG49065 - Fim

    frmAux.bAlterando := True; // Alterado por FHBS - 17/10/2019 - SIG81261

    frmAux.Caption := 'Aditamento do Contrato ' + dbeNomeContrato.Text;
    frmAux.ShowModal;
    if (frmAux.ModalResult = mrOk) then
    begin
      CtrlAditamento.CdsAditamento := frmAux.cdsAditamento;
      frmAux.cdsAditamento.Post;
      //Darivaldo Alencar SIG49065 -inicio
      cdsCtrlParcelaMedicao.Data := frmAux.cdsCtrlParcelaMedicao.Data;
      cdsServProdxItemContr.Data := frmAux.cdsServProdxItemContr.Data;
     //Darivaldo Alencar SIG49065 -inicio
      CtrlAditamento.AplicaAtualAditamento;
      CtrlAditamento.CdsAditamento := cdsAditamento;
      cdsAditamento.Data := CtrlAditamento.ListAditamento(0, cdsAditamento.FieldByName( 'IDCONTRATO' ).AsFloat );
    end;
  finally
    frmAux.Free;
  end;
end;

procedure TfrmAltAditamentoMT.sbtnAlterarClick(Sender: TObject);
begin
//  inherited;
  CmeCadastro.OnEdit( CmeCadastro );
end;

//Darivaldo Alencar SIG49065 -inicio
procedure TfrmAltAditamentoMT.CarregaContrato(const iContrato: Double);
begin
  cdsServProdxItemContr.close;
  cdsServProdxItemContr.Data := CtrlServProdxItemContr.ListProdServXItem(cdsAditamento.FieldByName( 'IDCONTRATO' ).AsFloat,0,0,False);
  cdsCtrlParcelaMedicao.close;
  cdsCtrlParcelaMedicao.Data := CtrlCtrlParcelaMedicao.ListCtrlParcelaMedicao(cdsAditamento.FieldByName( 'IDCONTRATO' ).AsFloat);
end;
//Darivaldo Alencar SIG49065 -fim

//SIG88476 - Ewerton Beltramini - 11/11/2020 - Inicio...
procedure TfrmAltAditamentoMT.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if cds.RecordCount > 0 then //FieldByName( 'IDCONTRATO' ).AsFloat > 0 then
  begin
        sbtnApagar.Enabled := True;
        sbtnApagar.Visible := True;
  end;
end;


procedure TfrmAltAditamentoMT.CmeCadastroDelete(Sender: TObject);
var
  frmAux : TfrmCadAditamentoMTDel;
begin

  frmAux := TfrmCadAditamentoMTDel.Create(Self);
  try

      frmAux.cdsAditamento.Data := CtrlAditamento.ListAditamento(cdsAditamento.FieldByName( 'IDADITAMENTO' ).AsFloat, cdsAditamento.FieldByName( 'IDCONTRATO' ).AsFloat );
      frmAux.cdsAditamento.Edit;
      frmAux.cdsAditamento.FieldByName( 'ID_TEMP' ).Value := '1';
      frmAux.cdsAditamento.Post;
      cdsLogAditamento.Data := CtrlAditamento.ListLogAditamento(cdsAditamento.FieldByName( 'IDADITAMENTO' ).AsFloat );
      frmAux.rIdContrato := cdsAditamento.FieldByName( 'IDCONTRATO' ).AsFloat; //SIG 96771
      frmAux.rIdCorrecao := 1;

      //Osni cavalcante/Darivaldo Alencar - SIG49065 - Início
      CarregaContrato(cdsAditamento.FieldByName( 'IDCONTRATO' ).AsFloat);
      cdsCtrlParcelaMedicao.EmptyDataSet;
      frmAux.cdsCtrlParcelaMedicao.Data := cdsCtrlParcelaMedicao.Data;
      frmAux.cdsServProdXItemContr.Data := cdsServProdxItemContr.Data;
      //Osni cavalcante/Darivaldo Alencar - SIG49065 - Fim


    frmAux.Caption := 'Exclusão do Aditamento do Contrato: ' + dbeNomeContrato.Text;
    frmAux.ShowModal;

    if (frmAux.ModalResult = mrOk) then
    begin

      CtrlAditamento.CdsAditamento := frmAux.cdsAditamento;
      //frmAux.cdsAditamento.Post;
      cdsCtrlParcelaMedicao.Data := frmAux.cdsCtrlParcelaMedicao.Data;
      cdsServProdxItemContr.Data := frmAux.cdsServProdxItemContr.Data;
      CtrlAditamento.AplicaAtualAditamento;
      CtrlAditamento.CdsAditamento := cdsAditamento;
      cdsAditamento.Data := CtrlAditamento.ListAditamento( 0, cdsAditamento.FieldByName( 'IDCONTRATO' ).AsFloat);

    end;
  finally
    frmAux.Free;
  end;
end;

procedure TfrmAltAditamentoMT.sbtnApagarClick(Sender: TObject);
begin
  //inherited;
    CmeCadastro.OnDelete( CmeCadastro );
end;
//SIG88476 - Ewerton Beltramini - 11/11/2020 - Fim.

// Paulo Nobre -  WO15750 - Inicio
procedure TfrmAltAditamentoMT.dbgGrdDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
Var R : TRect;
begin
  If Not cdsAditamento.isEmpty Then
  Begin
    R:=Rect;
    Dec(R.Bottom,2);

    // Colorindo a linha do aditamento que não reiniciou as parcelas
    If (cdsAditamento.FieldByName('FLGTIPO').asString = 'A') AND   // Aditamento
       (cdsAditamento.FieldByName('FLGREINICIODASPARCELAS').asString = 'N') Then  // Não
    Begin
      dbgGrd.Canvas.Font.Color := clRed;
      dbgGrd.Canvas.Font.Style := [fsbold];
      dbgGrd.DefaultDrawDataCell(Rect, Field, State);
    End;

    // Por conta do uso deste metodo, foi necessário aplicar este macete
    // para não apresentar a coluna de descrição como campo MEMO
    if field.FieldName = 'DESCADITAMENTO' Then
    begin
       dbgGrd.Canvas.FillRect(Rect);
       dbgGrd.Canvas.TextRect(R, R.Left, R.Top, cdsAditamentoDESCADITAMENTO.AsString);
    end;
  end;
end;
// Paulo Nobre -  WO15750 - Fim

end.


