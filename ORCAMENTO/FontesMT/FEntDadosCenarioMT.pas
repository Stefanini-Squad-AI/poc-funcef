// Atualizado em: 30/10/2003 - André Tavares - pendência 15026
unit FEntDadosCenarioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbedit, TREdit, Mask, Wwdbspin, Spin, Db, DBTables, Wwquery,
  MontaSelect, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, FOkCancelar, DBCtrls,
  IvDictio, IvMulti, IvEMulti, wwdblook, CMDBLookupCombo, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlValorescenario, uCMTypes,
  uCtrlBlqEntDados;

type
  TOperacao = (opVazio, opIdle, opInserir, opAlterar, opProcurar, opApagar);

  TfrmEntDadosCenarioMT = class(TfrmOkCancelar)
    lblExercicio: TLabel;
    Label1: TLabel;
    dbgrdSaldo: TwwDBGrid;
    dsSaldo: TwwDataSource;
    spnedExercicio: TSpinEdit;
    MontaSelect: TMontaSelect;
    ds: TwwDataSource;
    rdgSinal: TRadioGroup;
    lblCodigoConta: TLabel;
    bbtnBuscaConta: TBitBtn;
    edtNomeConta: TEdit;
    edtCodigoConta: TEdit;
    dblcCenario: TCMDBLookupCombo;
    lblCenario: TLabel;
    sql: TCMSqlParams;
    sqlSaldo: TCMSqlParams;
    sqlCenario: TCMSqlParams;
    sqlPeriodo: TCMSqlParams;
    cds: TCMClientDataSet;
    cdsSaldo: TCMClientDataSet;
    cdsCenario: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    cdsSaldoEXERCICIO: TFloatField;
    cdsSaldoPERIODO: TFloatField;
    cdsSaldoIDVALORESCENARIO: TFloatField;
    cdsSaldoVLRORCCENARIO: TCurrencyField;
    lblPeriodo: TLabel;
    redPeriodo: TDBRealEdit;
    redValorOrcado: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure spnedExercicioChange(Sender: TObject);
    procedure edtCodigoContaExit(Sender: TObject);
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure dbgrdSaldoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdSaldoTopRowChanged(Sender: TObject);
    procedure redPeriodoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure AbreSaldos;
    procedure DesabilitaControles;
    function  AbrePeriodo(exercicio: integer): boolean;
    procedure HabilitaControles;
    procedure LimpaValores;
    function  VerificaPeriodo(periodo: integer): boolean;
    procedure PegaProximoPeriodo;
    procedure cdsSaldoBeforePost(DataSet: TDataSet);
    procedure cdsSaldoAfterScroll(DataSet: TDataSet);
    procedure redValorOrcadoEnter(Sender: TObject);
    procedure redValorOrcadoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlValorescenario: TCtrlValorescenario;
    CtrlBlqEntDados: TCtrlBlqEntDados;

  public
    { Public declarations }
    OperacaoCadastro : TOperacao;
  end;

var
  frmEntDadosCenarioMT: TfrmEntDadosCenarioMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo,
     uCtrlOrcamento;

{$R *.DFM}

procedure TfrmEntDadosCenarioMT.FormCreate(Sender: TObject);
var sDataIni: string;
    iExercicio: integer;
begin
  inherited;
  cdsCenario.Close;
  sqlCenario.Prepare;
  sqlCenario.Open;
  AbreSaldos;
  DesabilitaControles;
  sDataini    := FormatDateTime ('dd/mm/yyyy',date);
  iExercicio  := StrToInt(copy(sDataini,7,4));
  spnedExercicio.value := iExercicio;
  OperacaoCadastro := opIdle;
  MontaSelect.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +
                         IntToStr(modulo.iPlanoOrc));
  MontaSelect.Filtro.Add('CONTASORCAMEN.CODCENTRORESPON IN (SELECT ' +
                         'CODCENTRORESPON FROM PESSOAXCRESP WHERE ' +
                         'IDPESSOAACESSO = ' + IntToStr(Sistema.idUsuario)+')');
  CtrlValorescenario := TCtrlValorescenario.Create;

  CtrlValorescenario.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlBlqEntDados := TCtrlBlqEntDados.Create;
  CtrlBlqEntDados.InitializeAs(CtrlValorescenario);
end;




procedure TfrmEntDadosCenarioMT.spnedExercicioChange(Sender: TObject);
begin
  inherited;
  //Muda para o próximo exercício selecionando seus saldos
  if Trim(edtCodigoConta.text) <> '' then begin
    LimpaValores;
    AbreSaldos;
    if AbrePeriodo(spnedExercicio.value) then begin
      HabilitaControles;
      redPeriodo.SetFocus;
    end;
  end;
end;

procedure TfrmEntDadosCenarioMT.edtCodigoContaExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if Trim(edtCodigoConta.text) <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc, edtCodigoConta.text,
       true, false, sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
       sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro) = 0 then begin
      edtNomeConta.text := sNomeConta;
      cds.Close;
      sql.Prepare;
      sql.ParamByName('IDPLANOORCAMEN').asInteger := modulo.iPlanoOrc;
      sql.ParamByName('IDCONTAORCAMEN').asString  := edtCodigoConta.text;
      sql.Open;
      if cds.FieldByName('FLGSINALCONTA').asString = 'P' then begin
        rdgSinal.itemIndex := 0;
      end else begin
        rdgSinal.itemIndex := 1;
      end;
      LimpaValores;
      AbreSaldos;
      if AbrePeriodo(spnedExercicio.value) then begin
        HabilitaControles;
        redPeriodo.SetFocus;
      end;
    end else begin
      edtCodigoConta.text := '';
      edtNomeConta.text   := '';
      edtCodigoConta.SetFocus;
    end;
  end;
end;

procedure TfrmEntDadosCenarioMT.bbtnBuscaContaClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelect.ValoresChave[1], true, false, sNomeConta, sCodCentroRespon,
       sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev, sCCusto,
       sPatro) = 0 then begin
      edtCodigoConta.text := MontaSelect.ValoresChave[1];
      edtNomeConta.text   := sNomeConta;
      cds.Close;
      sql.Prepare;
      sql.ParamByName('IDPLANOORCAMEN').asInteger := modulo.iPlanoOrc;
      sql.ParamByName('IDCONTAORCAMEN').asString  := edtCodigoConta.text;
      sql.Open;
      if cds.FieldByName('FLGSINALCONTA').asString = 'P' then begin
        rdgSinal.itemIndex := 0;
      end else begin
        rdgSinal.itemIndex := 1;
      end;
      LimpaValores;
      AbreSaldos;
      if AbrePeriodo(spnedExercicio.value) then begin
        HabilitaControles;
        redPeriodo.SetFocus;
      end;
    end else begin
      edtCodigoConta.text := '';
      edtCodigoConta.SetFocus;
    end;
  end;
end;

procedure TfrmEntDadosCenarioMT.dbgrdSaldoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  //Faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
    if not Highlight then begin
      if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
        ABrush.color := clwhite
      end else begin
        ABrush.Color := $00C0FFFF; //Amarelo Bebê
      end;
    end;
  end else begin
    ABrush.Color := clHighLight;
    AFont.Color  := clHighLightText;
  end;
end;




procedure TfrmEntDadosCenarioMT.dbgrdSaldoTopRowChanged(Sender: TObject);
begin
  inherited;
  //Acerta as cores quando muda a linha da grid
  dbgrdSaldo.invalidate;
end;




Procedure TfrmEntDadosCenarioMT.redPeriodoExit(Sender: TObject);
Begin
  Inherited;
  //Verifica a existência do período corrente
  If redPeriodo.value <> 0 Then Begin
    With cdsSaldo Do Begin
      If VerificaPeriodo(trunc(redPeriodo.value)) Then Begin
        If Locate('PERIODO',redPeriodo.Text,[]) Then Begin
          OperacaoCadastro := opAlterar;
          redValorOrcado.value    := StrToFloat(Format('%15.2f', [FieldByName('VLRORCCENARIO').asFloat]));
        End Else Begin
          OperacaoCadastro := opInserir;
        End;
      End Else Begin
        redPeriodo.value := 0;
        redPeriodo.SetFocus;
        LimpaValores;
      End;
    End;
  End;
End;




Procedure TfrmEntDadosCenarioMT.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;

  Screen.Cursor := crSQLWait;

  If ( CdsSaldo.State <> dsBrowse ) Then Begin

    CdsSaldo.Post;
  End;

    If ( redPeriodo.value <> 0 ) Then
    Begin
      if not CtrlBlqEntDados.TestaEntDadosBlq(Sistema.IdUsuario,Sistema.IdEmpresa,
                                             trunc(redPeriodo.value),trunc(spnedExercicio.value),
                                              StrToIntDef(dblcCenario.LookUpValue,0)) then
      begin
         MsgDlg(CtrlBlqEntDados.MessageInfo,'Aviso',mtWarning,[mbOk],0);
         Exit;
      end;

      

      If ( OperacaoCadastro = opInserir ) Then
      Begin
        CtrlValorescenario.InsereValor( CtrlValorescenario.LerSequencia,
                                        StrToInt(dblcCenario.LookUpValue),
                                        cds.FieldByName('IDPLANOORCAMEN').asInteger,
                                        spnedExercicio.value,trunc(redPeriodo.value),
                                        Sistema.IdEmpresa,edtCodigoConta.text,
                                        redValorOrcado.value);
      End
      Else
      Begin
        CtrlValorescenario.AltValor( cdsSaldo.FieldByName('IDVALORESCENARIO').AsInteger,
                                     redValorOrcado.value );
      End;
    End;

  //dá refresh na tabela de Saldos
  AbreSaldos;

  cdsSaldo.Last;
  PegaProximoPeriodo;
  If ( redPeriodo.enabled ) Then redPeriodo.SetFocus;

  Screen.Cursor := crDefault;

  try
    Sistema.GravaLogOperacoes('Entrada de Dados Cenário.');
  except
    Raise Exception.Create('Não foi possível Gravar o Log');
  end;

End;




procedure TfrmEntDadosCenarioMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //Cancela a operação de entrada de dados
  OperacaoCadastro := opIdle;
  DesabilitaControles;
  LimpaValores;
  cds.Close;
  cdsSaldo.Close;
end;




procedure TfrmEntDadosCenarioMT.AbreSaldos;
begin
  //Abre a cds de Saldos de acordo com os parâmetros fornecidos
  cdsSaldo.Close;
  With sqlSaldo Do Begin
    Prepare;
    ParamByName('IDCONTAORCAMEN').asString    := edtCodigoConta.text;
    ParamByName('EXERCICIO').asInteger        := spnedExercicio.value;
    ParamByName('IDPLANOORCAMEN').AsInteger   := modulo.iPlanoOrc;
    ParamByName('IDPESSOA').asInteger         := Sistema.IdEmpresa;
    If trim(dblcCenario.LookUpValue) <> '' Then
      ParamByName('IDCENARIOORCAMEN').asInteger := StrToInt(dblcCenario.LookUpValue)
    Else
      ParamByName('IDCENARIOORCAMEN').asInteger := -1;
    Open;
  End;
  cdsSaldo.First;
End;




procedure TfrmEntDadosCenarioMT.DesabilitaControles;
begin

  //Desabilita os controles de ediçao
  redPeriodo.enabled         := false;
  redValorOrcado.enabled     := false;
  bbtnConfirmar.enabled      := false;
  bbtnCancelar.enabled       := false;
end;




function TfrmEntDadosCenarioMT.AbrePeriodo (exercicio: integer):boolean;
begin
  //Abre os períodos para o Exercício selecionado
  cdsPeriodo.Close;
  with sqlPeriodo do begin
    Prepare;
    ParamByName('EXERCICIO').asInteger := exercicio;
    ParamByName('PESSOA').asInteger    := Sistema.IdEmpresa;
    Open;
  end;
  if cdsPeriodo.IsEmpty then begin
    MsgDlg('Não existem períodos para este Exercício.', 'Aviso', mtWarning,
           [mbOk], 0);
    Result := false;
  end else begin
    redPeriodo.value := cdsPeriodo.FieldByName('PERIODO').asInteger;
    Result := true;
  end;
end;




procedure TfrmEntDadosCenarioMT.HabilitaControles;
begin

  //Habilita os controles de ediçao
  redPeriodo.enabled         := true;
  redValorOrcado.enabled     := true;
  bbtnConfirmar.enabled      := true;
  bbtnCancelar.enabled       := true;
end;




procedure TfrmEntDadosCenarioMT.LimpaValores;
begin
  //Limpa os valores dos campos numéricos
  redPeriodo.value        := 0;
  redValorOrcado.value    := 0;
end;




function TfrmEntDadosCenarioMT.VerificaPeriodo (periodo: integer):boolean;
begin
  //Verifica se o período corrente é válido
  with cdsPeriodo do begin
    if Locate('PERIODO', redPeriodo.Text, []) then begin
      if FieldByName('FLGBLOQUEADO').asString = 'S' then begin
        MsgDlg('Período Bloqueado.', 'Aviso', mtWarning, [mbOk], 0);
        Result := false;
      end else begin
        Result := true;
      end;
    end else begin
      MsgDlg('Não existe esse período para esse Exercício.', 'Aviso',
             mtWarning, [mbOk], 0);
      Result := false;
    end;
  end;
end;




procedure TfrmEntDadosCenarioMT.PegaProximoPeriodo;
var msg : string;
begin
  //Pega o próximo período dentro do exercício.
  //Se for o ultimo tenta passar para o próximo
  with cdsPeriodo do begin
    Next;
    if not Eof then begin
      redPeriodo.value := FieldByName('PERIODO').asInteger;
    end else begin
      msg := 'Este é o último período do Exercício.' + CHR(13) +
             'Deseja passar para o próximo Exercício?';
      if MsgDlg(msg, 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
        spnedExercicio.value := spnedExercicio.value + 1;
      end;
    end;
  end;
end;
//************************************************




Procedure TfrmEntDadosCenarioMT.cdsSaldoBeforePost(DataSet: TDataSet);
Begin
  Inherited;

  iF ( CdsSaldo.FieldByName('EXERCICIO').AsInteger = 0 ) Then Begin

    CdsSaldo.FieldByName('EXERCICIO').AsInteger     := spnedExercicio.Value;
  End;
End;
//************************************************



procedure TfrmEntDadosCenarioMT.cdsSaldoAfterScroll(DataSet: TDataSet);
begin
  inherited;

  redPeriodo.Value        := cdsSaldo.FieldByName('PERIODO').AsInteger;
  redValorOrcado.Value    := cdsSaldo.FieldByName('VLRORCCENARIO').asFloat;
  bbtnConfirmar.Enabled   := False;

  If ( Not CdsPeriodo.IsEmpty ) Then Begin
    CdsPeriodo.Locate( 'PERIODO', redPeriodo.Text, [] );
    OperacaoCadastro := opAlterar;
  End;
end;
//************************************************



Procedure TfrmEntDadosCenarioMT.redValorOrcadoEnter(Sender: TObject);
Begin
  Inherited;
  bbtnConfirmar.Enabled := True;
End;
//************************************************



Procedure TfrmEntDadosCenarioMT.redValorOrcadoExit(Sender: TObject);
Begin
  Inherited;
  bbtnConfirmar.Enabled := True;
End;



procedure TfrmEntDadosCenarioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlBlqEntDados);
  FreeAndNil(CtrlValorescenario);
  inherited;
end;

End.
