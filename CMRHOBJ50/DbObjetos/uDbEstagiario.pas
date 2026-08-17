//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: criação da Db
//Responsável: Felipe A. Santos
//Descrição: criação da Db para armazenar o dados da cessão
//******************************************************************************

unit uDbEstagiario;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
   TDbEstagiario = class(TCmDbObject)

   private
    FIdInstituicaoEnsino: TCmDbField;
    FNumApolSeguro: TCmDbField;
    FAreaAtuacao: TCmDbField;
    FNaturezaEstagio: TCmDbField;
    FIdEstagiario: TCmDbField;
    FNivel: TCmDbField;
    FIdSupervisor: TCmDbField;
    FIdAgenteInt: TCmDbField;

   protected
       function Insert : boolean; override;
   public
     constructor Create(AOwner: TCmCustomCdbObject) ; override;

     property IdEstagiario: TCmDbField read FIdEstagiario write FIdEstagiario;
     property NaturezaEstagio : TCmDbField read FNaturezaEstagio write FNaturezaEstagio;
     property Nivel : TCmDbField read FNivel write FNivel;
     property AreaAtuacao : TCmDbField read FAreaAtuacao write FAreaAtuacao;
     property NumApolSeguro : TCmDbField read FNumApolSeguro write FNumApolSeguro;
     property IdInstituicaoEnsino : TCmDbField read FIdInstituicaoEnsino write FIdInstituicaoEnsino;
     property IdAgenteInt : TCmDbField read FIdAgenteInt write FIdAgenteInt;
     property IdSupervisor : TCmDbField read FIdSupervisor write FIdSupervisor;
   end;

implementation

{ TDbEstagiario }

constructor TDbEstagiario.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'ESTAGIARIO';

  FIdEstagiario := CreateCmDbField('IDESTAGIARIO', ftFloat, True, True, False, True,'');
  FNivel := CreateCmDbField('NIVEL', ftFloat, False, False, False, True,'');
  FIdInstituicaoEnsino := CreateCmDbField('IDINSTITUICAOENSINO', ftFloat, False, False, False, True,'');
  FNumApolSeguro := CreateCmDbField('NUMAPOLSEGURO', ftFloat, False, False, False, True,'');
  FAreaAtuacao := CreateCmDbField('AREAATUACAO', ftString, False, False, False, True,'');
  FNaturezaEstagio := CreateCmDbField('NATUREZAESTAGIO', ftString, False, False, False, True,'');
  FIdAgenteInt := CreateCmDbField('IDAGENTEINT', ftString, False, False, False, True,'');
  FIdSupervisor :=  CreateCmDbField('IDSUPERVISOR', ftString, False, False, False, True,'');
end;

function TDbEstagiario.Insert: boolean;
begin
  FIdEstagiario.AsFloat := GetSequence('ESTAGIARIO');
  Result := inherited Insert;
end;

end.
