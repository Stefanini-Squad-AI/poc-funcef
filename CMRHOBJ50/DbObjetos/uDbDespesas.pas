{***************************************************************************************************
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
Rotinas.....: .dfm (exclusão abas avaliação, mudança na aba cursos)
{--------------------------------------------------------------------------------------------------
Rotina......: Criação do Form
Nº SOL......: 177768
Nº KINTANA..: 1635450
Data........: 19/11/2012
Responsável.: Thiago Melo
Descrição...: Alteração na forma de Registro Individual de Treinamento.
--------------------------------------------------------------------------------------------------}

unit uDbDespesas;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbDespesas = class(TCmDbObject)
  private
    FIdCurso: TCmDbField;
    FValorMensalidade: TCmDbField;
    FIdMensalidades: TCmDbField;
    FDtVencimentoParc: TCmDbField;
    FQtdParcela: TCmDbField;
    FValor: TCmDbField;
    FIdPessoa: TCmDbField;
    FNParcela: TCmDbField;
    FValorEmpresa: TCmDbField;
    FValorEmpregado: TCmDbField;
    FPercentEmpregado: TCmDbField;
    FPercentEmpresa: TCmDbField;
    FEntregue: TCmDbField;
    FValorEmpresaAt: TCmDbField;
    FMetaAtuarial: TCmDbField;
    FDtAtualizacao: TCmDbField;
    FQtdParcPrev: TCmDbField;
    FNumSeq: TCmDbField;
    FPartEmpresa : TCmDbField;
    FPartEmpregado : TCmDbField;
    FIdTurma : TCmDbField;
    FFlgTeto : TCmDbField;


  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdCurso          : TCmDbField read FIdCurso write FIdCurso;
    property IdPessoa         : TCmDbField read FIdPessoa write FIdPessoa;
    property IdMensalidades   : TCmDbField read FIdMensalidades write FIdMensalidades;
    property NumSeq           : TCmDbField read FNumSeq write FNumSeq;
    property QtdParcPrev      : TCmDbField read FQtdParcPrev write FQtdParcPrev;
    property NParcela         : TCmDbField read FNParcela write FNParcela;
    property ValorMensalidade : TCmDbField read FValorMensalidade write FValorMensalidade;
    property DtVencimentoParc : TCmDbField read FDtVencimentoParc write FDtVencimentoParc;
    property ValorEmpresa     : TCmDbField read FValorEmpresa write FValorEmpresa;
    property ValorEmpregado   : TCmDbField read FValorEmpregado write FValorEmpregado;
    property ValorEmpresaAt   : TCmDbField read FValorEmpresaAt write FValorEmpresaAt;
    property MetaAtuarial     : TCmDbField read FMetaAtuarial   write FMetaAtuarial;
    property DtAtualizacao    : TCmDbField read FDtAtualizacao  write FDtAtualizacao;
    property PartEmpresa      : TCmDbField read FPartEmpresa    write FPartEmpresa;
    property PartEmpregado    : TCmDbField read FPartEmpregado  write FPartEmpregado;
    property IdTurma          : TCmDbField read FIdTurma write FIdTurma;
    property FlgTeto          : TCmDbField read FFlgTeto write FFlgTeto;

  end;

implementation

{ TDbDespesas }

constructor TDbDespesas.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'MENSALIDADES';

  FIdMensalidades   := CreateCmDbField('IDMENSALIDADES',ftFloat,True,True,False,True,'Código Mensalidade');
  FIdCurso          := CreateCmDbField('IDCURSO', ftFloat, True, False, False, False,'ID Curso');
  FIdPessoa         := CreateCmDbField('IDPESSOA', ftFloat, True, False, False, False, 'ID Pessoa');
  FNumSeq           := CreateCmDbField('NUMSEQ', ftFloat, True, False, False, False, 'Número Sequencia');
  FQtdParcPrev      := CreateCmDbField('QTDPARCPREV', ftInteger, True, False, False, False, 'Qtd. Parc. Prevista');
  FNParcela         := CreateCmDbField('NPARCELA', ftInteger, True, False, False, False, 'Nº Parcela');
  FValorMensalidade := CreateCmDbField('VALORMENSALIDADE', ftFloat, True, False, False, False, 'Valor Mensalidade');
  FDtVencimentoParc := CreateCmDbField('DTVENCIMENTOPARC', ftDate, True, False, False, True, 'Data Vencimento');
  FValorEmpresa     := CreateCmDbField('VALOREMPRESA',ftFloat,False,False,False,True,'Valor Empresa');
  FValorEmpregado   := CreateCmDbField('VALOREMPREGADO',ftFloat,False,False,False,True,'Valor Empregado');
  FValorEmpresaAt   := CreateCmDbField('VALOREMPRESA_AT',ftFloat,False,False,False,True,'Valor Empresa Atualizado');
  FMetaAtuarial     := CreateCmDbField('METAATUARIAL',ftFloat,False,False,False,True,'Meta Atuarial');
  FDtAtualizacao    := CreateCmDbField('DTATUALIZACAO',ftDateTime,False,False,False,True,'Data Atualização');
  FPartEmpresa      := CreateCmDbField('PERCEMPRESA',ftFloat,False,False,False,True,'Percentual Empresa');          // Edilaine - SOL 137268-7062 / KTN 1497173
  FPartEmpregado    := CreateCmDbField('PERCEMPREGADO',ftFloat,False,False,False,True,'Percentual Empregado');      // Edilaine - SOL 137268-7062 / KTN 1497173
  FIdTurma          := CreateCmDbField('IDTURMA', ftFloat, True, False, False, False,'ID Turma do Curso');          // Edilaine - SOL 137268-7062 / KTN 1497173
  FFlgTeto          := CreateCmDbField('FLGTETO', ftString, True, False, False, False,'ID Turma do Curso');         // Edilaine - SOL 137268-7062 / KTN 1497173

end;

function TDbDespesas.Insert: boolean;
begin
  FIdMensalidades.AsFloat := GetSequence('MENSALIDADES');             
  Result := inherited Insert;
end;

end.
