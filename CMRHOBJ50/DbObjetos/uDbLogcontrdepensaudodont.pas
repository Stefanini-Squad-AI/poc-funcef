{***************************************************************************************
Nº SOL: 229874/16589
Nº PPM: 1235881
Data da Alteração: 19/02/2016
Alteração Form: ER141 - Alteração na aba de dados pessoais e dados titular
Responsável: Michelle Suellyn Mota
Descrição: Inclusão de novos campos, alteração de leiaute e consultas.
**************************************************************************************
Nº SOL......: 184808
Nº KINTANA..: 1731587
Data........: 13/08/2012
Responsavel.: William Moreira
Descrição...: Inclusão das opções de data de inclusão e exclusão dos dependentes no plano de saúde
              e odontológico em Cadastro/Dependentes/Dados Pessoais.
-------------------------------------------------------------------------------------------------- }

unit uDbLogcontrdepensaudodont;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase, uSistema;

Type
  TDbLogcontrdepensaudodont = class(TCmDbObject)
  private
     FTipo: TCmDbField;
     FIdPessoa: TCmDbField;
     FCampo: TCmDbField;
     FData: TCmDbField;
     // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
     FValor: TCmDbField;
     // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  public

     //Property Trguserinclusao: TCmDbField;
     //Property Trgdtinclusao: TCmDbField;
     Property Tipo: TCmDbField read FTipo write FTipo;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Campo: TCmDbField read FCampo write FCampo;
     Property Data: TCmDbField read FData write FData;
     // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
     Property Valor: TCmDbField read FValor write FValor;
     // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     //Function Insert :Boolean; Override;
     function Update :Boolean; Override;
  End;

implementation

{ TDbLogcontrdepensaudodont }

constructor TDbLogcontrdepensaudodont.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOGCONTRDEPENSAUDODONT';

   //rguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   //rgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fTipo := CreateCmDbField('TIPO',ftString,True,False,False,True,'');
   fCampo := CreateCmDbField('CAMPO',ftString,True,False,False,True,'');
   fData := CreateCmDbField('DATA',ftDateTime,False,False,False,True,'');
   // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
   FValor := CreateCmDbField('VALOR',ftString,False,False,False,True,'');
   // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881
end;

{function TDbLogcontrdepensaudodont.Insert: Boolean;
begin
   Result := Inherited Insert;
end;}

function TDbLogcontrdepensaudodont.Update: Boolean;
begin
  Result := Inherited Insert;
end;

end.



