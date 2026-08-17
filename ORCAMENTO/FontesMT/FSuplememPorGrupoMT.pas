unit FSuplememPorGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, TREdit, wwdblook, CMDBLookupCombo, uCtrlPlanPrevContabPatro,
  uCtrlPadroes, uCtrlTransacoesPorGrupo, uSistema, uMensErro, uModulo, uDiasUteis;

type
  TFrmSuplememPorGrupoMT = class(TFrmCadastroMT)
    Grid: TwwDBGrid;
    CdsPlanoTrab: TCMClientDataSet;
    CdsCRespon: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsPlano: TCMClientDataSet;
    CdsContas: TCMClientDataSet;
    edtDescGrupo: TEdit;
    Label1: TLabel;
    btBuscGrupoOrigem: TSpeedButton;
    Label2: TLabel;
    cboPlanoTrab: TCMDBLookupCombo;
    Label5: TLabel;
    cboCCusto: TwwDBLookupCombo;
    Label6: TLabel;
    cboCentroRespon: TwwDBLookupCombo;
    Label4: TLabel;
    cboPatroOrigem: TCMDBLookupCombo;
    Label3: TLabel;
    cboPlanoOrigem: TCMDBLookupCombo;
    Label20: TLabel;
    edtPeriodo: TDBRealEdit;
    Label22: TLabel;
    edtExercicio: TDBRealEdit;
    btSelContas: TBitBtn;
    CdsCCusto: TCMClientDataSet;
    msGrupo: TMontaSelect;
    dsContas: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboPatroOrigemEnter(Sender: TObject);
    procedure cboPlanoOrigemEnter(Sender: TObject);
    procedure btBuscGrupoOrigemClick(Sender: TObject);
    procedure btSelContasClick(Sender: TObject);
    procedure CdsContasAfterOpen(DataSet: TDataSet);
    procedure GridRowChanged(Sender: TObject);
    procedure CdsContasBeforePost(DataSet: TDataSet);
    procedure GridUpdateFooter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridTopRowChanged(Sender: TObject);
  private
    { Private declarations }

    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlTransacoesPorGrupo  : TCtrlTransacoesPorGrupo;
    procedure ValidarSaldo(Field: TField);



  public
    { Public declarations }
  end;






var
  FrmSuplememPorGrupoMT: TFrmSuplememPorGrupoMT;

implementation

{$R *.DFM}

procedure TFrmSuplememPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(Padroes);
  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);

  Cds.Data          := CtrlTransacoesPorGrupo.ListaSuplementacoes(-1,-1,-1,-1);
  CdsContas.Data    := Cds.Data;
  CdsPlanoTrab.Data := CtrlTransacoesPorGrupo.ListaReservaPlanoTrab(Sistema.IdUsuario,Sistema.IdEmpresa);
  CdsCCusto.Data    := CtrlTransacoesPorGrupo.ListaTransfCCusto(Sistema.IdUsuario,Sistema.IdEmpresa);
  CdsCRespon.Data   := CtrlTransacoesPorGrupo.ListaTransfCRespon(Sistema.IdUsuario);



  edtPeriodo.Text       := IntToStr(DiasUteis.ExtraiMes(date));
  edtExercicio.Text     := IntToStr(DiasUteis.ExtraiAno(date));







end;




procedure TFrmSuplememPorGrupoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlTransacoesPorGrupo);
  inherited;
end;




procedure TFrmSuplememPorGrupoMT.cboPatroOrigemEnter(Sender: TObject);
begin
  inherited;
  CdsPatro.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(StrToIntDef(cboPlanoOrigem.LookupValue,-1),-1,-1);
end;




procedure TFrmSuplememPorGrupoMT.cboPlanoOrigemEnter(Sender: TObject);
begin
  inherited;
  CdsPlano.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1,StrToIntDef(cboPatroOrigem.LookupValue,-1),-1);
end;




procedure TFrmSuplememPorGrupoMT.btBuscGrupoOrigemClick(Sender: TObject);
begin
  inherited;
  msGrupo.Executar;
  if msGrupo.RetornouValor then
    edtDescGrupo.Text := msGrupo.ValoresChave[2] + '-' + msGrupo.ValoresChave[1];

end;

procedure TFrmSuplememPorGrupoMT.btSelContasClick(Sender: TObject);
var
  iPlano,iPatro          : integer;
  sCentCusto,sCentRespon : string;
  
begin
  inherited;
  if Trim(edtDescGrupo.Text) = '' then
  begin
     MsgDlg('Informe o grupo orçamentário!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;
  if Trim(cboPlanoTrab.Text) = '' then
  begin
     MsgDlg('Informe o plano de trabalho!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;
  if StrToInt(edtPeriodo.Text) = 0 then
  begin
     MsgDlg('Informe o período!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;
  if StrToInt(edtExercicio.Text) = 0 then
  begin
     MsgDlg('Informe o exercício!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;




  // Plano
  if Trim(cboPlanoOrigem.Text) <> '' then
     iPlano := StrToIntDef(cboPlanoOrigem.LookupValue,-1)
  else
     iPlano := -1;
  // Patro
  if Trim(cboPatroOrigem.Text) <> '' then
     iPatro := StrToIntDef(cboPatroOrigem.LookupValue,-1)
  else
     iPatro := -1;
  // CCusto
  if Trim(cboCCusto.Text) <> '' then
     sCentCusto := cboCCusto.LookupValue
  else
     sCentCusto := '';
  // CRespon
  if Trim(cboCentroRespon.Text) <> '' then
     sCentRespon := cboCentroRespon.LookupValue
  else
     sCentRespon := '';



  CdsContas.Data := CtrlTransacoesPorGrupo.ListaSuplContas(Modulo.iPlanoOrc,
                                                           Sistema.IdUsuario,
                                                           StrToInt(msGrupo.ValoresChave[0]),
                                                           StrToIntDef(CdsPlanoTrab.FieldByName('UNIDNEGOC').AsString,-1),
                                                           iPlano,
                                                           iPatro,
                                                           StrToInt(edtPeriodo.Text),
                                                           StrToInt(edtExercicio.Text),
                                                           Sistema.IdEmpresa,
                                                           sCentCusto,
                                                           sCentRespon);
  TFloatField(CdsContas.FieldByName('VLRSUPLEMEM')).OnValidate := ValidarSaldo;                                                           

end;




procedure TFrmSuplememPorGrupoMT.CdsContasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VLRSUPLEMEM')).DisplayFormat  := '#,##0.00;-#,##0.00';
  TFloatField(DataSet.FieldByName('SALDO')).DisplayFormat        := '#,##0.00;-#,##0.00';
  TFloatField(DataSet.FieldByName('SALDO')).ReadOnly             := True;
  TStringField(DataSet.FieldByname('PERIODO')).ReadOnly          := True;
  TStringField(DataSet.FieldByname('EXERCICIO')).ReadOnly        := True;
  TStringField(DataSet.FieldByname('IDGRUPOORCAMEN')).ReadOnly   := True;
  TStringField(DataSet.FieldByname('IDCONTAORCAMEN')).ReadOnly   := True;
  TStringField(DataSet.FieldByname('NOMECONTAORCAMEN')).ReadOnly := True;
  TStringField(DataSet.FieldByname('CENTROCUSTO')).ReadOnly      := True;
  TStringField(DataSet.FieldByname('CENTRORESPON')).ReadOnly     := True;
end;




procedure TFrmSuplememPorGrupoMT.GridRowChanged(Sender: TObject);
begin
  inherited;
  // Controle para evitar que o usuário fique inserindo registro no grid
  if CdsContas.FieldByName('VALIDAR').AsString <> 'S' then
  begin
    TDateTimeField(CdsContas.FieldByName('DATAREFERENCIA')).ReadOnly := True;
    TFloatField(CdsContas.FieldByName('VLRSUPLEMEM')).ReadOnly       := True;
  end
  else
  begin
    TDateTimeField(CdsContas.FieldByName('DATAREFERENCIA')).ReadOnly := False;
    TFloatField(CdsContas.FieldByName('VLRSUPLEMEM')).ReadOnly       := False;
  end;

end;











procedure TFrmSuplememPorGrupoMT.ValidarSaldo(Field: TField);
begin

end;




procedure TFrmSuplememPorGrupoMT.CdsContasBeforePost(DataSet: TDataSet);
var
 rValor: Double;
begin
  inherited;

   if DataSet.FieldByName('VLRSUPLEMEM').AsFloat < 0 then
   begin
      MsgDlg('Não é possível suplementar valores negativos!','Aviso',mtWarning,[mbOk],0);
      DataSet.FieldByName('VLRSUPLEMEM').AsFloat := 0;
   end
   else
   begin
      TStringField(DataSet.FieldByName('SALDO')).ReadOnly := False;

      if DataSet.FieldByName('SALDO').OldValue <> null then
         rValor := DataSet.FieldByName('SALDO').OldValue
      else
         rValor := DataSet.FieldByName('SALDO').AsFloat;

      DataSet.FieldByName('SALDO').AsFloat := rValor + DataSet.FieldByName('VLRSUPLEMEM').AsFloat;
      TStringField(DataSet.FieldByName('SALDO')).ReadOnly := True;
   end;
end;




procedure TFrmSuplememPorGrupoMT.GridUpdateFooter(Sender: TObject);
var
   rTotalSaldo,rTotalSuplemen: Double;
   CdsAux: TClientDataSet;
begin
  inherited;
   try
      rTotalSaldo    := 0;
      rTotalSuplemen := 0;
      CdsAux := TCMClientDataSet.Create(nil);

      CdsAux.Data := CdsContas.Data;

      while not CdsAux.Eof do
      begin
         rTotalSaldo    := rTotalSaldo    + CdsAux.FieldByName('SALDO').AsFloat;
         rTotalSuplemen := rTotalSuplemen + CdsAux.FieldByName('VLRSUPLEMEM').AsFloat;
         CdsAux.Next;
      end;

      Grid.ColumnByName('SALDO').FooterValue       := FormatFloat('#,##0.00;-#,##0.00',rTotalSaldo);
      Grid.ColumnByName('VLRSUPLEMEM').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rTotalSuplemen);

   finally
      FreeAndNil(CdsAux);
   end;

end;





procedure TFrmSuplememPorGrupoMT.GridExit(Sender: TObject);
begin
  inherited;
  case CdsContas.State of
     dsEdit   : CdsContas.Post;
     dsInsert : CdsContas.Cancel;
  end;
end;




procedure TFrmSuplememPorGrupoMT.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   // Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
     if not(Highlight) then
     begin
       if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
       begin
         ABrush.color := clwhite
       end
       else
       begin
         ABrush.Color := $00C0FFFF; //Amarelo Bebê
       end;
     end;
   end
   else
   begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
   end;
end;



procedure TFrmSuplememPorGrupoMT.GridTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;

end.
