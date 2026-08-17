unit FEntDadosMT;

{-----------------------------------------------------------------------------------------
 Data      : 02.02.2006
 Autor     : Antonio Marcos Fernandes de Souza (amf)
 Pendência : 21401 - CBS
 Descrição :  - Controle de tela. O usuário estava conseguindo editar o valor do orçado
                de períodos bloqueados. Resolvi o problema controlando o enabled do botão
                confirmar.
              - A mensagem de último período, só ocorre quando o registro está apontado no
                último mês do exercício (dezembro - 12). O ponteiro se mantém no
                regitro/período que estava selecionado.
---------------------------------------------------------------------------------
// Rotina    : btnConfirmarClick
// Data      : 16.01.2006
// Autor     : Antonio Marcos Fernandes de Souza (amf)
// Pendência : 21241 - Invalid Floating Point Value
// Descrição : O erro foi gerado devido a propriedade Text do componente redValorRealizado
//             e redValorOrcado. Para corrigir, passei diretamente o Field. Para evitar
//             o mesmo tipo de erro, fiz a mesma alteração para o valor Orçado.
//==============================================================================
// Rotina    : dsSaldoChange
// Data      : 26.12.2005
// Autor     : Antonio Marcos Fernandes de Souza (amf)
// Pendência : 21223
// Descrição : Verifiquei o período a cada seleção do registro no Grid, tratando a
//             propriedade Enabled dos componentes redValorOrcado e redValorRealizado.
//==============================================================================
// Rotina    : AtualizaEdits
// Data      : 13/10/2005
// Autor     : Rodolpho da Silva
// Pendência : 18526
// Descrição : Permitir que só sejam lançados valores para as contas que forem
//             parametrizadas como "Valor Informado Manualmente" , tanto para
//             os valores Orçados como Realizados
//==============================================================================
// Data      : 10/10/2005
// Autor     : Rodolpho da Silva
// Pendência : 18321
// Descrição : Filtrar no MontaSelect apenas as contas orçamentárias ativas
//============================================================================== }
// data 28/10/2003 - André Tavares - pendência 15026

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbedit, TREdit, Mask, Wwdbspin, Spin, Db, DBTables, Wwquery,
  MontaSelect, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, FOkCancelar, DBCtrls,
  IvDictio, IvMulti, IvEMulti, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlSaldoorcado, uCMTypes, uCtrlPeriodoOrcamen;

type
  TOperacao = (opVazio, opIdle, opInserir, opAlterar, opProcurar, opApagar);

  TfrmEntradaDadosMT = class(TfrmOkCancelar)
    lblExercicio: TLabel;
    lblPeriodo: TLabel;
    rgrpTipo: TRadioGroup;
    Label1: TLabel;
    dbgrdSaldo: TwwDBGrid;
    Label3: TLabel;
    dsSaldo: TwwDataSource;
    spnedExercicio: TSpinEdit;
    MontaSelect: TMontaSelect;
    ds: TwwDataSource;
    rdgSinal: TRadioGroup;
    rgPerDia: TRadioGroup;
    lblCodigoConta: TLabel;
    bbtnBuscaConta: TBitBtn;
    edtNomeConta: TEdit;
    edtCodigoConta: TEdit;
    sqlSaldo: TCMSqlParams;
    cdsSaldo: TCMClientDataSet;
    sql: TCMSqlParams;
    cds: TCMClientDataSet;
    sqlSaldoAcum: TCMSqlParams;
    cdsSaldoAcum: TCMClientDataSet;
    sqlPeriodo: TCMSqlParams;
    cdsPeriodo: TCMClientDataSet;
    sqlRegs: TCMSqlParams;
    cdsRegs: TCMClientDataSet;
    cdsSaldoVLRORCADO: TCurrencyField;
    cdsSaldoVLRREALIZADO: TCurrencyField;
    cdsSaldoVLRRESERVADO: TCurrencyField;
    cdsSaldoVLRCOMPROMETIDO: TCurrencyField;
    cdsSaldoEXERCICIO: TFloatField;
    cdsSaldoPERIODO: TFloatField;
    cdsSaldoSALDOACUMULADO: TFloatField;
    redPeriodo: TDBRealEdit;
    cdsSaldoTIPOCALCORCADO: TStringField;
    cdsSaldoTIPOCALCREALIZADO: TStringField;
    redValorOrcado: TDBEdit;
    redValorRealizado: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spnedExercicioChange(Sender: TObject);
    procedure sqlSaldoAcumFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure edtCodigoContaExit(Sender: TObject);
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure dbgrdSaldoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdSaldoTopRowChanged(Sender: TObject);
    procedure redPeriodoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DesabilitaControles;
    procedure HabilitaControles;
    procedure AbreSaldos;
    function  AbrePeriodo(exercicio: integer): boolean;
    procedure LimpaValores;
    function  VerificaPeriodo(periodo: integer): boolean;
    function PegaProximoPeriodo: boolean;
    procedure cdsSaldoCalcFields(DataSet: TDataSet);
    procedure cdsSaldoBeforePost(DataSet: TDataSet);
    procedure cdsSaldoAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure dsSaldoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    CtrlSaldoorcado    : TCtrlSaldoorcado;

    CtrlPeriodoOrcamen : TCtrlPeriodoOrcamen;

    procedure AtualizaEdits;
  public
    { Public declarations }
    OperacaoCadastro : TOperacao;
  end;

var
  frmEntradaDadosMT: TfrmEntradaDadosMT;

implementation

uses UMensErro, UDatabase, DBaseDados, UAutorizacao, USistema, UModulo,
     UCtrlOrcamento;

{$R *.DFM}

procedure TfrmEntradaDadosMT.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +
                         IntToStr(modulo.iPlanoOrc));

  MontaSelect.Filtro.Add('CONTASORCAMEN.CODCENTRORESPON IN (SELECT ' +
                         'CODCENTRORESPON FROM PESSOAXCRESP WHERE ' +
                         'IDPESSOAACESSO = ' + IntToStr(Sistema.idUsuario)+')');

  CtrlSaldoorcado := TCtrlSaldoorcado.Create;

  CtrlSaldoorcado.Initialize( DtmBaseDados.dbBaseDados, True,
                              Sistema.ConnectionType,   Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlPeriodoOrcamen := TCtrlPeriodoOrcamen.Create;
  CtrlPeriodoOrcamen.InitializeAs(CtrlSaldoOrcado);
end;




procedure TfrmEntradaDadosMT.FormShow(Sender: TObject);
var sDataIni: string;
    iExercicio: integer;
begin
  inherited;
  DesabilitaControles;
  sDataini    := FormatDateTime ('dd/mm/yyyy',date);
  iExercicio  := StrToInt(copy(sDataini,7,4));
  spnedExercicio.value := iExercicio;
  OperacaoCadastro := opIdle;
end;




procedure TfrmEntradaDadosMT.spnedExercicioChange(Sender: TObject);
begin
  inherited;
  //Muda para o próximo exercício selecionando seus saldos
  if Trim(edtCodigoConta.text) <> '' then begin
    AbreSaldos;
    if AbrePeriodo(spnedExercicio.value) then begin
      HabilitaControles;
      redPeriodo.SetFocus;
    end;
    //LimpaValores;
  end;
end;




procedure TfrmEntradaDadosMT.sqlSaldoAcumFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'TIPO') then
    sNewValue := sOldValue;
end;




procedure TfrmEntradaDadosMT.edtCodigoContaExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro : string;
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
      AbreSaldos;

      //Controla as caixas de entrada de valores
      AtualizaEdits;

      if AbrePeriodo(spnedExercicio.value) then begin
        HabilitaControles;
        redPeriodo.SetFocus;
      end;
      //LimpaValores;
    end else begin
      edtCodigoConta.text := '';
      edtNomeConta.text   := '';
      edtCodigoConta.SetFocus;
    end;
  end;
end;




procedure TfrmEntradaDadosMT.bbtnBuscaContaClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro : string;
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
      AbreSaldos;

      //Controla as caixas de entrada de valores
      AtualizaEdits;

      if AbrePeriodo(spnedExercicio.value) then begin
        HabilitaControles;
        redPeriodo.SetFocus;
      end;
      //LimpaValores;
    end else begin
      edtCodigoConta.text := '';
      edtCodigoConta.SetFocus;
    end;
  end;
end;



//************************************************
procedure TfrmEntradaDadosMT.dbgrdSaldoCalcCellColors(Sender: TObject;
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


procedure TfrmEntradaDadosMT.dbgrdSaldoTopRowChanged(Sender: TObject);
begin
  inherited;
  //Acerta as cores quando muda a linha da grid
  dbgrdSaldo.invalidate;
end;

procedure TfrmEntradaDadosMT.redPeriodoExit(Sender: TObject);
begin
  inherited;
end;




//************************************************
Procedure TfrmEntradaDadosMT.bbtnConfirmarClick(Sender: TObject);
Var
  i,
  iNumeroDias,
  iNumDivide    : integer;
  dDataCorrente : TDateTime;
  PeriodoAnt : integer;
  rSalvaPeriodo: extended;
Begin
  Inherited;

  if (redPeriodo.Value < 1) or (redPeriodo.Value > 12) then
    begin
      MsgDlg('Valor inválido para o Período!','Erro',mtError,[mbOk],0);
      if redPeriodo.CanFocus then
         redPeriodo.SetFocus;
      EXIT;
    end;

  if (not VerificaPeriodo(cdsSaldo.FieldByName('PERIODO').AsInteger)) then
  begin
     exit;
  end;

  If ( CdsSaldo.State <> dsBrowse ) Then Begin

    CdsSaldo.Post;
  End;
  screen.cursor := crSQLWait;

  //Faz o loop para varrer os dias, dividindo o valor entre eles
  iNumeroDias   := Trunc( cdsPeriodo.FieldByName('DataFimPeriodo').AsDateTime -
                          cdsPeriodo.FieldByName('DataIniPeriodo').AsDateTime ) + 1;
  dDataCorrente := cdsPeriodo.FieldByName('DataIniPeriodo').AsDateTime;

  If ( rgPerDia.ItemIndex = 0 ) Then Begin

    iNumDivide := iNumeroDias
  End Else Begin

    iNumDivide := 1;
  End;

  For i := 1 to iNumeroDias do begin

    cdsRegs.Close;
    With sqlRegs Do Begin

      Prepare;
      ParamByName('IDCONTAORCAMEN').asString   := edtCodigoConta.text;
      ParamByName('IDPLANOORCAMEN').asFloat    := cds.FieldByName('IDPLANOORCAMEN').asInteger;
      ParamByName('IDPESSOA').asInteger        := Sistema.idEmpresa;
      ParamByName('DATAREFERENCIA').asDateTime := dDataCorrente;
      Open;

      sqlchanged;
    end;

    If ( cdsRegs.FieldByName('DATAREFERENCIA').asDateTime <> 0 ) Then Begin

      CtrlSaldoorcado.AltSaldos2(
                                 (cdsSaldo.FieldByName('VLRREALIZADO').AsFloat) / iNumDivide,
                                 (cdsSaldo.FieldByName('VLRORCADO').AsFloat) / iNumDivide,
                                 Sistema.idEmpresa,
                                 cds.FieldByName('IDPLANOORCAMEN').asInteger,
                                 FormatDateTime('dd/mm/yyyy',dDataCorrente),
                                 Trim(edtCodigoConta.text) );
    End Else Begin

      CtrlSaldoorcado.InsereSaldo( spnedExercicio.value,
                      Trunc( redPeriodo.Value ),
                      cds.FieldByName('IDPLANOORCAMEN').asInteger,
                      Sistema.IdEmpresa,
                      Trim(edtCodigoConta.text),
                      FormatDateTime('dd/mm/yyyy',dDataCorrente),
                      (cdsSaldo.FieldByName('VLRORCADO').AsFloat) / iNumDivide,
                      (cdsSaldo.FieldByName('VLRREALIZADO').AsFloat) / iNumDivide,
                      0,0,0,0);
    End;

    //Incrementa a data corrente para o próximo registro de saldo
    dDataCorrente := dDataCorrente + 1;
  End;

  Screen.Cursor := crDefault;
  //Incrementa o contador de períodos

  //dá refresh na tabela de Saldos
  rSalvaPeriodo := redPeriodo.Value;
  cdsSaldo.Close;
  With sqlSaldo do begin
    Prepare;
    ParamByName('CONTA').asString      := edtCodigoConta.Text;
    ParamByName('EXERCICIO').asInteger := spnedExercicio.Value;
    ParamByName('PLANO').asFloat       := cds.FieldByName('IDPLANOORCAMEN').AsInteger;
    ParamByName('PESSOA').asFloat      := Sistema.idEmpresa;
    Open;
    sqlSaldo.ClientDataSet.Locate('PERIODO', rSalvaPeriodo, []);
  End;

  PegaProximoPeriodo;

  If ( redPeriodo.enabled ) Then redPeriodo.SetFocus;

  try
    Sistema.GravaLogOperacoes('Entrada de Dados por período.');
  except
    Raise Exception.Create('Não foi possível Gravar o Log');
  end;

End;


procedure TfrmEntradaDadosMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //Cancela a operação de entrada de dados
  OperacaoCadastro := opIdle;
  DesabilitaControles;
  cds.Close;
  cdsSaldo.Close;
end;




procedure TfrmEntradaDadosMT.DesabilitaControles;
begin
  //Desabilita os controles de ediçao
  redPeriodo.enabled        := false;
  redValorOrcado.enabled    := false;
  redValorRealizado.enabled := false;
  bbtnConfirmar.enabled     := false;
  bbtnCancelar.enabled      := false;
end;




procedure TfrmEntradaDadosMT.HabilitaControles;
begin
  //Habilita os controles de ediçao
  redPeriodo.enabled    := true;
  bbtnConfirmar.enabled := true;
  bbtnCancelar.enabled  := true;
end;

//************************************************
Procedure TfrmEntradaDadosMT.AbreSaldos;
Begin
  //Abre a cds de Saldos de acordo com os parâmetros fornecidos
  cdsSaldo.Close;
  With sqlSaldo Do Begin
    Prepare;
    ParamByName('CONTA').asString      := edtCodigoConta.Text;
    ParamByName('EXERCICIO').asInteger := spnedExercicio.Value;
    ParamByName('PLANO').asFloat       := cds.FieldByName('IDPLANOORCAMEN').AsInteger;
    ParamByName('PESSOA').asFloat      := Sistema.idEmpresa;
    Open;
  End;

  AtualizaEdits;
End;




function TfrmEntradaDadosMT.AbrePeriodo(exercicio: integer): boolean;
begin
  //Abre os períodos para o Exercício selecionado
  cdsPeriodo.Close;
  with sqlPeriodo do begin
    Prepare;
    ParamByName('EXERCICIO').asInteger := exercicio;
    ParamByName('PESSOA').asInteger    := Sistema.IdEmpresa;
    Open;
  end;
  with cdsPeriodo do begin
    if isEmpty then begin
      MsgDlg('Não existem períodos para este Exercício.', 'Aviso', mtWarning,
             [mbOk], 0);
      Result := false;
    end else begin
      redPeriodo.value := FieldByName('PERIODO').asInteger;
      Result := true;
    end;
  end;
end;


procedure TfrmEntradaDadosMT.LimpaValores;
begin
  //Limpa os valores dos campos numéricos
  redPeriodo.value        := 0;
end;




function TfrmEntradaDadosMT.VerificaPeriodo(periodo: integer): boolean;
begin
  //Verifica se o período corrente é válido
  with cdsPeriodo do begin
    if Locate('PERIODO',Periodo,[]) then begin
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


function TfrmEntradaDadosMT.PegaProximoPeriodo: boolean;
var msg : string;
    cdsAux: TClientDataSet;
begin
   Result := False;
  //Pega o próximo período dentro do exercício.
  //Se for o ultimo tenta passar para o próximo
  with cdsPeriodo do begin
    next;
    if not eof then begin
      redPeriodo.value := FieldByName('PERIODO').asInteger;
    end else begin
      msg := 'Este é o último período do Exercício.' + CHR(13) +
             'Deseja passar para o próximo Exercício?';
      if MsgDlg(msg, 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
        spnedExercicio.value := spnedExercicio.value + 1;
        Result := True;
      end;
    end;
  end;
end;




procedure TfrmEntradaDadosMT.cdsSaldoCalcFields(DataSet: TDataSet);
var sTipo : string;
begin
  inherited;
  sTipo := modulo.sTipoSaldo;
  cdsSaldoAcum.Close;
  with sqlSaldoAcum do begin
    Prepare;
    ParamByName('IDPLANOORCAMEN').asInteger := Modulo.iPlanoOrc;
    ParamByName('IDCONTAORCAMEN').asString  := edtCodigoConta.text;
    ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
    case sTipo[1] of
      'P' : ParamByName('TIPO').asString := '(EXERCICIO = ' +
                                IntToStr(Trunc(spnedExercicio.value)) +
                                ') AND (PERIODO = ' +
                                IntToStr(Trunc(redPeriodo.value)) + ') ';
      'E' : ParamByName('TIPO').asString := '(EXERCICIO = ' +
                                IntToStr(Trunc(spnedExercicio.value)) + ') ';
      'A' : ParamByName('TIPO').asString := '(EXERCICIO = ' +
                                IntToStr(Trunc(spnedExercicio.value)) +
                                ') AND (PERIODO <= ' +
                                IntToStr(Trunc(redPeriodo.value)) + ') ';
    end;
    Open;
  end;
  cdsSaldoSALDOACUMULADO.asFloat := (cdsSaldoAcum.FieldByName('VALOR1').asFloat -
                                    (cdsSaldoAcum.FieldByName('VALOR2').asFloat +
                                    cdsSaldoAcum.FieldByName('VALOR3').asFloat));
end;




//************************************************
Procedure TfrmEntradaDadosMT.AtualizaEdits;
Begin

  Case rgrpTipo.ItemIndex Of
    0 : Begin
          redValorOrcado.enabled     := true;
          redValorRealizado.enabled  := false;
        End;
    1 : Begin
          redValorOrcado.enabled     := false;
          redValorRealizado.enabled  := true;
        End;
    2 : Begin
          redValorOrcado.enabled     := true;
          redValorRealizado.enabled  := true;
        End;
  End;

  redValorOrcado.Enabled    := (CdsSaldo.FieldByName('TIPOCALCORCADO').AsString = 'V');
  redValorRealizado.Enabled := (CdsSaldo.FieldByName('TIPOCALCREALIZADO').AsString = 'V');

End;


//************************************************
procedure TfrmEntradaDadosMT.cdsSaldoBeforePost(DataSet: TDataSet);
begin
  inherited;
  If ( CdsSaldo.FieldByName( 'EXERCICIO' ).AsInteger = 0 ) Then Begin
    CdsSaldo.FieldByName( 'EXERCICIO' ).AsInteger := spnedExercicio.Value;
  End;
end;

//************************************************
Procedure TfrmEntradaDadosMT.cdsSaldoAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  redPeriodo.Value        := cdsSaldo.FieldByName('PERIODO').AsInteger;

  If ( Not CdsPeriodo.IsEmpty ) Then
  Begin
     CdsPeriodo.Locate( 'PERIODO', redPeriodo.Text, [] );
  End;
End;


procedure TfrmEntradaDadosMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlPeriodoOrcamen);
  FreeAndNil(CtrlSaldoOrcado);
  inherited;
end;

procedure TfrmEntradaDadosMT.dsSaldoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if cdsSaldo.Active then
  begin
     if cdsPeriodo.Active then
     begin
        if cdsSaldo.FieldByName('PERIODO').AsInteger <> 0 then
        begin
           redValorOrcado.Enabled := VerificaPeriodo(cdsSaldo.FieldByName('PERIODO').AsInteger);
           redValorRealizado.Enabled := redValorOrcado.Enabled;
           bbtnConfirmar.Enabled := redValorOrcado.Enabled;
        end;
     end;
  end;
end;

end.
