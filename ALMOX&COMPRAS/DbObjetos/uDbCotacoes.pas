{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 29/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbCotacoes;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbCotacoes = class(TCmDbObject)

  private
    FNumCot: TCmDbField;
    FIdItemOC: TCmDbField;
    FIdForCli: TCmDbField;
    FCodProcesso: TCmDbField;
    FCodMedida: TCmDbField;
    FProposta: TCmDbField;
    FPreco: TCmDbField;
    FStatus: TCmDbField;
    FQtdeFornecida: TCmDbField;
    FDataCot: TCmDbField;
    FTxjuros: TCmDbField;
    FObs: TCmDbField;
    FPrecoAvalorPres: TCmDbField;
    FIdProcxArt: TCmDbField;
    FMoeCodigo: TCmDbField;
    FContato: TCmDbField;
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetCodProcesso(const Value: TCmDbField);
    procedure SetContato(const Value: TCmDbField);
    procedure SetDataCot(const Value: TCmDbField);
    procedure SetIdForCli(const Value: TCmDbField);
    procedure SetIdItemOC(const Value: TCmDbField);
    procedure SetIdProcxArt(const Value: TCmDbField);
    procedure SetMoeCodigo(const Value: TCmDbField);
    procedure SetNumCot(const Value: TCmDbField);
    procedure SetObs(const Value: TCmDbField);
    procedure SetPreco(const Value: TCmDbField);
    procedure SetPrecoAvalorPres(const Value: TCmDbField);
    procedure SetProposta(const Value: TCmDbField);
    procedure SetQtdeFornecida(const Value: TCmDbField);
    procedure SetStatus(const Value: TCmDbField);
    procedure SetTxjuros(const Value: TCmDbField);

  public

     Property Txjuros         : TCmDbField read FTxjuros write SetTxjuros;
     Property Status          : TCmDbField read FStatus write SetStatus;
     Property QtdeFornecida   : TCmDbField read FQtdeFornecida write SetQtdeFornecida;
     Property Proposta        : TCmDbField read FProposta write SetProposta;
     Property PrecoAvalorPres : TCmDbField read FPrecoAvalorPres write SetPrecoAvalorPres;
     Property Preco           : TCmDbField read FPreco write SetPreco;
     Property Obs             : TCmDbField read FObs write SetObs;
     Property NumCot          : TCmDbField read FNumCot write SetNumCot;
     Property MoeCodigo       : TCmDbField read FMoeCodigo write SetMoeCodigo;
     Property IdProcxArt      : TCmDbField read FIdProcxArt write SetIdProcxArt;
     Property IdItemOC        : TCmDbField read FIdItemOC write SetIdItemOC;
     Property IdForCli        : TCmDbField read FIdForCli write SetIdForCli;
     Property DataCot         : TCmDbField read FDataCot write SetDataCot;
     Property Contato         : TCmDbField read FContato write SetContato;
     Property CodProcesso     : TCmDbField read FCodProcesso write SetCodProcesso;
     Property CodMedida       : TCmDbField read FCodMedida write SetCodMedida;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCotacoes }

constructor TDbCotacoes.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COTACOES';

   fTxjuros         := CreateCmDbField('TXJUROS'         ,ftfloat,False,False,False,True,'');
   fStatus          := CreateCmDbField('STATUS'          ,ftString,False,False,False,True,'');
   fQtdefornecida   := CreateCmDbField('QTDEFORNECIDA'   ,ftfloat,False,False,False,True,'');
   fProposta        := CreateCmDbField('PROPOSTA'        ,ftfloat,True,True,False,True,'');
   fPrecoavalorpres := CreateCmDbField('PRECOAVALORPRES' ,ftfloat,False,False,False,True,'');
   fPreco           := CreateCmDbField('PRECO'           ,ftfloat,False,False,False,True,'');
   fObs             := CreateCmDbField('OBS'             ,ftString,False,False,False,True,'');
   fNumcot          := CreateCmDbField('NUMCOT'          ,ftfloat,False,False,False,True,'');
   fMoecodigo       := CreateCmDbField('MOECODIGO'       ,ftfloat,False,False,False,True,'');
   fIdprocxart      := CreateCmDbField('IDPROCXART'      ,ftfloat,True,True,False,True,'');
   fIditemoc        := CreateCmDbField('IDITEMOC'        ,ftfloat,False,False,False,True,'');
   fIdforcli        := CreateCmDbField('IDFORCLI'        ,ftfloat,True,True,False,True,'');
   fDatacot         := CreateCmDbField('DATACOT'         ,ftDateTime,False,False,False,True,'');
   fContato         := CreateCmDbField('CONTATO'         ,ftString,False,False,False,True,'');
   fCodprocesso     := CreateCmDbField('CODPROCESSO'     ,ftfloat,True,True,False,True,'');
   fCodmedida       := CreateCmDbField('CODMEDIDA'       ,ftString,False,False,False,True,'');

end;

function TDbCotacoes.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbCotacoes.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbCotacoes.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbCotacoes.SetCodProcesso(const Value: TCmDbField);
begin
  FCodProcesso := Value;
end;

procedure TDbCotacoes.SetContato(const Value: TCmDbField);
begin
  FContato := Value;
end;

procedure TDbCotacoes.SetDataCot(const Value: TCmDbField);
begin
  FDataCot := Value;
end;

procedure TDbCotacoes.SetIdForCli(const Value: TCmDbField);
begin
  FIdForCli := Value;
end;

procedure TDbCotacoes.SetIdItemOC(const Value: TCmDbField);
begin
  FIdItemOC := Value;
end;

procedure TDbCotacoes.SetIdProcxArt(const Value: TCmDbField);
begin
  FIdProcxArt := Value;
end;

procedure TDbCotacoes.SetMoeCodigo(const Value: TCmDbField);
begin
  FMoeCodigo := Value;
end;

procedure TDbCotacoes.SetNumCot(const Value: TCmDbField);
begin
  FNumCot := Value;
end;

procedure TDbCotacoes.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;

procedure TDbCotacoes.SetPreco(const Value: TCmDbField);
begin
  FPreco := Value;
end;

procedure TDbCotacoes.SetPrecoAvalorPres(const Value: TCmDbField);
begin
  FPrecoAvalorPres := Value;
end;

procedure TDbCotacoes.SetProposta(const Value: TCmDbField);
begin
  FProposta := Value;
end;

procedure TDbCotacoes.SetQtdeFornecida(const Value: TCmDbField);
begin
  FQtdeFornecida := Value;
end;

procedure TDbCotacoes.SetStatus(const Value: TCmDbField);
begin
  FStatus := Value;
end;

procedure TDbCotacoes.SetTxjuros(const Value: TCmDbField);
begin
  FTxjuros := Value;
end;

end.



