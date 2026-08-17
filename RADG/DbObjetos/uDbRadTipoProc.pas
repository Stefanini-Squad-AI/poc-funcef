{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/10/2006                             }
{                                                       }
{*******************************************************}

unit uDbRadTipoProc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadTipoProc = class(TCmDbObject)

  private
    FPrazoestimado: TCmDbField;
    FTxtaprovaradres: TCmDbField;
    FTxtrecusarad: TCmDbField;
    FIdreferencia: TCmDbField;
    FTxtrecusaetapa: TCmDbField;
    FIdgrupoprocesso: TCmDbField;
    FIdradtipoproc: TCmDbField;
    FNome: TCmDbField;
    FDescricao: TCmDbField;
    FTxtaprovaetapa: TCmDbField;
    FTxtaprovarad: TCmDbField;
    FTxtsolicaprov: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdreferencia(const Value: TCmDbField);
    procedure SetIdgrupoprocesso(const Value: TCmDbField);
    procedure SetIdradtipoproc(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetPrazoestimado(const Value: TCmDbField);
    procedure SetTxtaprovaetapa(const Value: TCmDbField);
    procedure SetTxtaprovarad(const Value: TCmDbField);
    procedure SetTxtaprovaradres(const Value: TCmDbField);
    procedure SetTxtrecusaetapa(const Value: TCmDbField);
    procedure SetTxtrecusarad(const Value: TCmDbField);
    procedure SetTxtsolicaprov(const Value: TCmDbField);

  public

     Property Txtsolicaprov: TCmDbField read FTxtsolicaprov write SetTxtsolicaprov;
     Property Txtrecusarad: TCmDbField read FTxtrecusarad write SetTxtrecusarad;
     Property Txtrecusaetapa: TCmDbField read FTxtrecusaetapa write SetTxtrecusaetapa;
     Property Txtaprovaradres: TCmDbField read FTxtaprovaradres write SetTxtaprovaradres;
     Property Txtaprovarad: TCmDbField read FTxtaprovarad write SetTxtaprovarad;
     Property Txtaprovaetapa: TCmDbField read FTxtaprovaetapa write SetTxtaprovaetapa;
     Property Prazoestimado: TCmDbField read FPrazoestimado write SetPrazoestimado;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idradtipoproc: TCmDbField read FIdradtipoproc write SetIdradtipoproc;
     Property Idgrupoprocesso: TCmDbField read FIdgrupoprocesso write SetIdgrupoprocesso;
     Property Idreferencia: TCmDbField read FIdreferencia write SetIdreferencia;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbRadTipoProc }

constructor TDbRadTipoProc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADTIPOPROC';

   fIdradtipoproc := CreateCmDbField('IDRADTIPOPROC',ftfloat,True,True,False,True,'Id. Tipo de Processo');
   fNome := CreateCmDbField('NOME',ftString,True,False,False,True,'Nome');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'Descrição');
   fIdreferencia := CreateCmDbField('IDREFERENCIA',ftfloat,False,False,False,True,'Evento Gerador');
   fIdgrupoprocesso := CreateCmDbField('IDGRUPOPROCESSO',ftfloat,True,False,False,True,'Id. Grupo de Processo');
   fPrazoestimado := CreateCmDbField('PRAZOESTIMADO',ftString,False,False,False,True,'Prazo estimado');         
   fTxtaprovaetapa := CreateCmDbField('TXTAPROVAETAPA',ftString,False,False,False,True,'Texto Etapa Aprovada');
   fTxtaprovarad := CreateCmDbField('TXTAPROVARAD',ftString,False,False,False,True,'Texto RAD Aprovado');
   fTxtaprovaradres := CreateCmDbField('TXTAPROVARADRES',ftString,False,False,False,True,'Texto RAD Aprovado c/ Ressalva');
   fTxtrecusaetapa := CreateCmDbField('TXTRECUSAETAPA',ftString,False,False,False,True,'Texto Etapa Recusada');
   fTxtrecusarad := CreateCmDbField('TXTRECUSARAD',ftString,False,False,False,True,'Texto RAD Recusado');
   fTxtsolicaprov := CreateCmDbField('TXTSOLICAPROV',ftString,False,False,False,True,'Texto Solicitação Aprovação');
end;


procedure TDbRadTipoProc.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbRadTipoProc.SetIdreferencia(const Value: TCmDbField);
begin
  FIdreferencia := Value;
end;

procedure TDbRadTipoProc.SetIdgrupoprocesso(const Value: TCmDbField);
begin
  FIdgrupoprocesso := Value;
end;

procedure TDbRadTipoProc.SetIdradtipoproc(const Value: TCmDbField);
begin
  FIdradtipoproc := Value;
end;

procedure TDbRadTipoProc.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbRadTipoProc.SetPrazoestimado(const Value: TCmDbField);
begin
  FPrazoestimado := Value;
end;

procedure TDbRadTipoProc.SetTxtaprovaetapa(const Value: TCmDbField);
begin
  FTxtaprovaetapa := Value;
end;

procedure TDbRadTipoProc.SetTxtaprovarad(const Value: TCmDbField);
begin
  FTxtaprovarad := Value;
end;

procedure TDbRadTipoProc.SetTxtaprovaradres(const Value: TCmDbField);
begin
  FTxtaprovaradres := Value;
end;

procedure TDbRadTipoProc.SetTxtrecusaetapa(const Value: TCmDbField);
begin
  FTxtrecusaetapa := Value;
end;

procedure TDbRadTipoProc.SetTxtrecusarad(const Value: TCmDbField);
begin
  FTxtrecusarad := Value;
end;

procedure TDbRadTipoProc.SetTxtsolicaprov(const Value: TCmDbField);
begin
  FTxtsolicaprov := Value;
end;

end.



