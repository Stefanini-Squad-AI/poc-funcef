{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 21/10/2002                                 }
{                                                       }
{*******************************************************}
{*******************************************************************************
RESPONSÁVEL.: William Santana
Nº SOL......: 199707
Nº KINTANA..: 1922320
Data........: 05/08/2013
Descrição...: Alteração na forma de Correção das Faixas Salariais
********************************************************************************
N. Sol..........: 171426
N. Kintana......: 1537613
Data............: 10/03/2012
Responsável.....: Edilaine Ferraresi
Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
*******************************************************************************}


unit uCtrlCorrecaoFaixaSal;

interface

uses SysUtils, Controls, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uCtrlFaixaSal, uCtrlPessoaFuncionario, uCtrlEvolFunc;

type
  TCtrlCorrecaoFaixaSal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlFaixaSal: TCtrlFaixaSal;
    FCtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    FCtrlEvolFunc: TCtrlEvolFunc;

    FIdEmpresa: integer;
    FTipoEmpresa: string;
  public
    constructor Create(IdEmpresa: integer; UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce; 
    destructor  Destroy; override;

    //William Santana SOL: 199707 - KINTANA: 1922320
   {function CorrigirFaixasSal(DataEfetivacao: TDate; PercCorrecao, Parcela: double;
      TipoArredondamento: integer; AtualizaSalEmpregados: boolean; TipoEvento: double;): boolean;}

    function CorrigirFaixasSal(DataEfetivacao: TDate; PercCorrecao, Parcela: double;
      TipoArredondamento: integer; AtualizaSalEmpregados: boolean; TipoEvento: double;
      cCodsIn: string ): boolean;

    function ListFaixaSal(IdFaixaSalarial: double ; CodsIn: string ): OleVariant;
    function ListFaixaSalGrid(IdFaixaSalarial: double = 0): OleVariant;

    //END - William Santana SOL: 199707 - KINTANA: 1922320
    property TipoEmpresa: string read FTipoEmpresa;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCorrecaoFaixaSal }

constructor TCtrlCorrecaoFaixaSal.Create(IdEmpresa: integer; UsuXFilial, UsuXCCusto,
  IdUsuarioGeral: string);
begin
  inherited Create;

  FCtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlFaixaSal := TCtrlFaixaSal.Create(IdEmpresa);
  FCtrlEvolFunc := TCtrlEvolFunc.Create;

  FIdEmpresa := IdEmpresa;
end;

procedure TCtrlCorrecaoFaixaSal.AfterInitialize;
begin
  inherited;
  FCtrlFaixaSal.InitializeAs(Self);
  FCtrlPessoaFuncionario.InitializeAs(Self);
  FCtrlEvolFunc.InitializeAs(Self);

  FCtrlEvolFunc.OpenTransaction := false;
  FCtrlFaixaSal.OpenTransaction := false;
  FTipoEmpresa := FCtrlFaixaSal.TipoEmpresa;
end;

destructor TCtrlCorrecaoFaixaSal.Destroy;
begin
  FCtrlFaixaSal.Free;
  FCtrlPessoaFuncionario.Free;
  FCtrlEvolFunc.Free;
  inherited;
end;

procedure TCtrlCorrecaoFaixaSal.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlCorrecaoFaixaSal.DoChangeDataBase;
begin
  inherited;
end;

//William Santana SOL: 199707 - KINTANA: 1922320
{function TCtrlCorrecaoFaixaSal.CorrigirFaixasSal(DataEfetivacao: TDate; PercCorrecao,
  Parcela: double; TipoArredondamento: integer; AtualizaSalEmpregados: boolean;
  TipoEvento: double): boolean;}
function TCtrlCorrecaoFaixaSal.CorrigirFaixasSal(DataEfetivacao: TDate; PercCorrecao,
  Parcela: double; TipoArredondamento: integer; AtualizaSalEmpregados: boolean;
  TipoEvento: double; cCodsIn: string): boolean;

//END - William Santana SOL: 199707 - KINTANA: 1922320
var
  c: byte;
  iNumReg: integer;
  rFator, rAjuste, rUltSalario: real;
  _CdsFaixa, _CdsFunc, _CdsHstCes: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.CorrigirFaixasSal(DataEfetivacao, PercCorrecao, Parcela,
      TipoArredondamento);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
   _CdsFaixa := TCMClientDataSet.Create(nil);
    _CdsFunc := TCMClientDataSet.Create(nil);
    if (AtualizaSalEmpregados) then
      _CdsHstCes := TCMClientDataSet.Create(nil);

      FCtrlFaixaSal.Cds := _CdsFaixa;

    if (AtualizaSalEmpregados) then
    begin
      FCtrlEvolFunc.CdsEvolFunc := _CdsHstCes;
      FCtrlEvolFunc.CdsFuncionario := _CdsFunc;
    end;

    case (TipoArredondamento) of
      1 : rFator := 10;
      2 : rFator := 1;
      3 : rFator := 0.10;
      4 : rFator := 0.01;
     else rFator := 100;
    end;

    if (TipoArredondamento = 0) then
      rAjuste := 0
    else
      rAjuste := 0.49;

    try
      DoProgresso(['Selecionando Dados...', 0, 0]);

      //William Santana SOL: 199707 - KINTANA: 1922320
      //_CdsFaixa.Data := FCtrlFaixaSal.ListFaixaSal;
      _CdsFaixa.Data := ListFaixaSal(0,cCodsIn);
      //END - William Santana SOL: 199707 - KINTANA: 1922320

      iNumReg := _CdsFaixa.RecordCount;

      if (AtualizaSalEmpregados) then
      begin
        _CdsFunc.Data := FCtrlPessoaFuncionario.ListEmpresaFuncionario(FIdEmpresa,
          'F.*', '', 'A,F');
        _CdsHstCes.Data := FCtrlEvolFunc.ListEvolFunc(-1);
        iNumReg := iNumReg + _CdsFunc.RecordCount;
      end;

      DoProgresso(['Atualizando Faixas...', iNumReg, 0]);
      StartTransaction;

      // Atualização das Faixas Salariais
      while not(_CdsFaixa.EOF) do
      begin
        _CdsFaixa.Edit;
        _CdsFaixa.FieldByName('DATAEFETIV').asDateTime := DataEfetivacao;

        for c:=1 to 20 do // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - de 9 para 20
          if (_CdsFaixa.FieldByName('STEP'+IntToStr(c)).asFloat > 0) then
            _CdsFaixa.FieldByName('STEP'+IntToStr(c)).asFloat :=
              Round((_CdsFaixa.FieldByName('STEP'+IntToStr(c)).asFloat +
                ((_CdsFaixa.FieldByName('STEP'+IntToStr(c)).asFloat *
                  PercCorrecao) / 100) + Parcela) * rFator + rAjuste) / rFator;

        _CdsFaixa.Post;

        _CdsFaixa.Next;
        DoProgresso(['', 0, 1]);
      end;

      // Atualização do Cdastro dos Empregados e Histórico de Evolução Funcional
      if (AtualizaSalEmpregados) then
      begin
        DoProgresso(['Atualizando Salários dos Empregados...', 0, 0]);
        _CdsFunc.First;
        while not(_CdsFunc.EOF) do
        begin
          if not(_CdsFunc.FieldByName('IDFAIXACARGO').IsNull) and
             not(_CdsFunc.FieldByName('NIVELINDIV1').IsNull) and
             (_CdsFaixa.Locate('IDFAIXASALARIAL', _CdsFunc.FieldByName('IDFAIXACARGO').asFloat, [])) then
          begin
            rUltSalario := _CdsFunc.FieldByName('SALARIOATUAL').asFloat;

            _CdsFunc.Edit;
            _CdsFunc.FieldByName('SALARIOATUAL').asFloat :=
              _CdsFaixa.FieldByName('STEP' +_CdsFunc.FieldByName('NIVELINDIV1').asString).asFloat;
            _CdsFunc.FieldByName('DATASALARIO').asDateTime := DataEfetivacao;
            _CdsFunc.Post;

            //Cria Histórico
            _CdsHstCes.Insert;
            _CdsHstCes.FieldByName('IDPESSOA').asFloat := _CdsFunc.FieldByName('IDPESSOA').asFloat;
            _CdsHstCes.FieldByName('DATAALTERFUNC').asDateTime := DataEfetivacao;
            _CdsHstCes.FieldByName('IDESTAB').asFloat := _CdsFunc.FieldByName('IDESTAB').asFloat;
            _CdsHstCes.FieldByName('IDEMPRESA').asInteger := _CdsFunc.FieldByName('IDEMPRESA').asInteger;
            _CdsHstCes.FieldByName('CODCENTROCUSTO').asString := _CdsFunc.FieldByName('CODCENTROCUSTO').asString;
            _CdsHstCes.FieldByName('IDCARGO').asFloat := _CdsFunc.FieldByName('IDCARGO').asFloat;
            _CdsHstCes.FieldByName('SALARIO').asFloat := _CdsFunc.FieldByName('SALARIOATUAL').asFloat;
            _CdsHstCes.FieldByName('IDMOTIVO').asFloat := TipoEvento;
            _CdsHstCes.FieldByName('TRGDTINCLUSAO').asDateTime := Now;
            
            if (rUltSalario = 0) then
              _CdsHstCes.FieldByName('PERC_REAJ').asFloat := 0
            else
              _CdsHstCes.FieldByName('PERC_REAJ').asFloat :=
                (_CdsFunc.FieldByName('SALARIOATUAL').asFloat - rUltSalario) * 100 / rUltSalario;

            _CdsHstCes.FieldByName('TIPOPAGAMENTO').asString := _CdsFunc.FieldByName('TIPOPAGAMENTO').asString;
            _CdsHstCes.Post;
          end;
          _CdsFunc.Next;
          DoProgresso(['', 0, 1]);
        end;
      end;

      if (FCtrlFaixaSal.Gravar) then
      begin
        if not(AtualizaSalEmpregados) or
           ((AtualizaSalEmpregados) and (FCtrlEvolFunc.GravarEvolFunc(true))) then
        begin
          Commit;
          Result := true;
          MessageInfo := 'Procedimento Concluído com sucesso.';
        end
        else
        begin
          raise Exception.Create('Processo Abortado.'+CR_LF+
            'Um erro ocorreu ao tentar fazer a atualização do Salários dos Empregados.'+CR_LF+
            'Erro:' +CR_LF+ FCtrlEvolFunc.MessageInfo);
        end;
      end
      else
      begin
        raise Exception.Create('Processo Abortado.'+CR_LF+
          'Um erro ocorreu ao tentar fazer a correção das Faixas.'+CR_LF+
          'Erro:' +CR_LF+ FCtrlFaixaSal.MessageInfo);
      end;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    _CdsFaixa.Free;
    _CdsFunc.Free;
    if (AtualizaSalEmpregados) then
      _CdsHstCes.Free;
  end;
end;

//William Santana SOL: 199707 - KINTANA: 1922320
function TCtrlCorrecaoFaixaSal.ListFaixaSalGrid(IdFaixaSalarial: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdFaixaSalarial=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    ' 0 as SELECTED, ' +CR_LF+
    ' IDFAIXASALARIAL AS "CODIGO", CODFAIXAPCS as "FaixaPCS", STEP1 as "NIVEL1",'+CR_LF+
    ' STEP2 as "NIVEL2", STEP3 as "NIVEL3", STEP4 as "NIVEL4", STEP5 as "NIVEL5", '  +CR_LF+
    ' STEP6 as "NIVEL6", STEP7 as "NIVEL7", STEP8 as "NIVEL8", STEP9 as "NIVEL9" , '+CR_LF+
    ' STEP10 as "NIVEL10", STEP11 as "NIVEL11", STEP12 as "NIVEL12", '+CR_LF+
    ' STEP13 as "NIVEL13", STEP14 as "NIVEL14", STEP15 as "NIVEL15",STEP16 as "NIVEL16",'+CR_LF+
    ' STEP17 as "NIVEL17", STEP18 as "NIVEL18",STEP19 as "NIVEL19",STEP20 as "NIVEL20"'+CR_LF+
    'FROM'+CR_LF+
    '  FAIXASAL'+CR_LF+
    IFF(IdFaixaSalarial=-1, 'WHERE (1 = 2)',
      IFF(IdFaixaSalarial=0, 'ORDER BY'+CR_LF+'  IDFAIXASALARIAL', 'WHERE'+CR_LF+
      '  (IDFAIXASALARIAL = '+FloatToStr(IdFaixaSalarial)+')')));
end;

function TCtrlCorrecaoFaixaSal.ListFaixaSal(IdFaixaSalarial: double; CodsIn: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdFaixaSalarial=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDFAIXASALARIAL, CODFAIXAPCS, DATAEFETIV, STEP1, STEP2, STEP3, STEP4, STEP5,'+CR_LF+
    '  STEP6, STEP7, STEP8, STEP9, Step10, Step11, Step12, Step13, Step14,'+CR_LF+
    '  Step15,Step16,Step17,Step18,Step19,Step20'+CR_LF+
    'FROM'+CR_LF+
    '  FAIXASAL'+CR_LF+
    IFF(IdFaixaSalarial=-1, 'WHERE (1 = 2)',
      IFF(IdFaixaSalarial=0, 'WHERE IDFAIXASALARIAL in '+CodsIn +
       'ORDER BY'+CR_LF+'  IDFAIXASALARIAL', 'WHERE'+CR_LF+
      '  (IDFAIXASALARIAL = '+FloatToStr(IdFaixaSalarial)+')')));
end;

//END - William Santana


end.
