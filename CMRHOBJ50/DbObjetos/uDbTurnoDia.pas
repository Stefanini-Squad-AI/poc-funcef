{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Nº SOL             : 259921/18014 - ER159
 Nº PPM             : 1217940
 Data da Alteração  : 10/03/2016
 Alteração Form     : Alterações de leiaute e campos de tabela para atender
                      ao eSocial.
 Responsável        : Michelle Suellyn Mota
 Descrição          : Alterações de leiaute e campos de tabela para atender
                      ao eSocial.
--------------------------------------------------------------------------------
Nº SOL...........: 229874/16592
Nº PPM...........: 544753
Data da Alteração: 21/11/2014
Responsável......: Felipe Azevedo dos Santos
Descrição........: criado campos referente ao eSocial.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/12/2001                                 }
{                                                       }
{*******************************************************}

unit uDbTurnoDia;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTurnoDia = class(TCmDbObject)
  private
    FIdTurnoDiario: TCmDbField;
    FInicioExpediente: TCmDbField;
    FInicioAlmoco: TCmDbField;
    FFinalAlmoco: TCmDbField;
    FFinalExpediente: TCmDbField;

    // Felipe A. Santos - SOL 229874/16592 PPM 544753  - início
    FTipoJornada: TCmDbField;
    FTipoIntervJornada: TCmDbField;
    FVariacaoHoraSaida: TCmDbField;
    //FDescricao: TCmDbField; //Everson Cunha - SIG38475
    FVariacaoHoraEntrada: TCmDbField;
    FDuracaoIntervalo: TCmDbField; // Felipe A. Santos - SOL 229874/16592 PPM 544753 - fim

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdTurnoDiario: TCmDbField read FIdTurnoDiario write FIdTurnoDiario;
    property InicioExpediente: TCmDbField read FInicioExpediente write FInicioExpediente;
    property InicioAlmoco: TCmDbField read FInicioAlmoco write FInicioAlmoco;
    property FinalAlmoco: TCmDbField read FFinalAlmoco write FFinalAlmoco;
    property FinalExpediente: TCmDbField read FFinalExpediente write FFinalExpediente;

    // Felipe A. Santos - SOL 229874/16592 PPM 544753  - início
    property VariacaoHoraEntrada: TCmDbField read FVariacaoHoraEntrada write FVariacaoHoraEntrada;
    property VariacaoHoraSaida: TCmDbField read FVariacaoHoraSaida write FVariacaoHoraSaida;
    property TipoJornada: TCmDbField read FTipoJornada write FTipoJornada;
    //property Descricao: TCmDbField read FDescricao write FDescricao; //Everson Cunha - SIG38475
    property TipoIntervJornada: TCmDbField read FTipoIntervJornada write FTipoIntervJornada;
    property DuracaoIntervalo: TCmDbField read FDuracaoIntervalo write FDuracaoIntervalo;
    // Felipe A. Santos - SOL 229874/16592 PPM 544753  - fim
  end;

implementation

{ TDbTurnoDia }

constructor TDbTurnoDia.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TURNODIA';

  FIdTurnoDiario := CreateCmDbField('IDTURNODIARIO',ftFloat,true,true,false,true,'');
  FInicioExpediente := CreateCmDbField('INICIOEXPEDIENTE',ftString,false,false,false,true,'');
  FInicioAlmoco := CreateCmDbField('INICIOALMOCO',ftString,false,false,false,true,'');
  FFinalAlmoco := CreateCmDbField('FINALALMOCO',ftString,false,false,false,true,'');
  FFinalExpediente := CreateCmDbField('FINALEXPEDIENTE',ftString,false,false,false,true,'');

   // Felipe A. Santos - SOL 229874/16592 PPM 544753 - início
  FTipoJornada := CreateCmDbField('TIPOJORNADA',ftString,false,false,false,true,''); //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
//  FTipoJornada := CreateCmDbField('TIPOJORNADA',ftFloat,false,false,false,true,''); //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
//  FTipoIntervJornada := CreateCmDbField('TIPOINTERVJORNADA',ftFloat,false,false,false,false,'');//Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  FTipoIntervJornada := CreateCmDbField('TIPOINTERVJORNADA',ftString,false,false,false,false,'');//Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  FVariacaoHoraSaida := CreateCmDbField('VARIACAOHORASAIDA',ftFloat,false,false,false,true,'');
  //FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'') ; //Everson Cunha - SIG38475
  FVariacaoHoraEntrada := CreateCmDbField('VARIACAOHORAENTRADA',ftFloat,false,false,false,true,'');
  FDuracaoIntervalo := CreateCmDbField('DURACAOINTERVALO',ftFloat,false,false,false,true,'');
  // Felipe A. Santos - SOL 229874/16592 PPM 544753 - fim
end;

end.
