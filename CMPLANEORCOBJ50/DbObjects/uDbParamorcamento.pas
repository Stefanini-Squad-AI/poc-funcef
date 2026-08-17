// Alterações:
{ --------------------------------------------------------------------------------------------------
Data         : 17/08/2011
Autor        : Ricardo de Freitas Araújo Silva
Sol\ Kintana : 159212 \ 1337867
Descrição    : Criação dos campos FLGTIPOCOD7 e TAMCOD7 (prevendo Programa)
               Criação dos campos FLGTIPOCOD8 e TAMCOD8 (prevendo Tipo de Despesa)
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 27/11/2003
Autor     : André Pontes
Pendencia :
Descrição : Criação dos campos FLGTIPOCOD6 e TAMCOD6 (prevendo Centro de Responsabilidade)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 18/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : 1) Retirados os campos FLGUSACOD1 a 5
            2) Alterados os campos TIPOCOD1 a 5 para FLGTIPOCOD1 a 5
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : até 09/09/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : unit re-criada em função das alterações na tabela ParamOrcamento: foram criados os campos
            FLGUSACOD1 a 5, TIPOCOD1 a 5 e TAMCOD1 a 5.
---------------------------------------------------------------------------------------------------}


{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 08/09/2003                             }
{                                                       }
{*******************************************************}

unit uDbParamorcamento;

interface

uses
   uCmCustomCdbObject, uCmDbObject, DB, uDataBase;



Type
   TDbParamorcamento = class(TCmDbObject)

   private
      FIdcontaorcresult: TCmDbField;
      FTamcod3: TCmDbField;
      FIdpessoa: TCmDbField;
      FTamcod5: TCmDbField;
      FMoecodigo: TCmDbField;
      FTamcod4: TCmDbField;
      FMascgrupoorc: TCmDbField;
      FFlgpermitetransf: TCmDbField;
      FTipocod3: TCmDbField;
      FTamcod2: TCmDbField;
      FTipocod1: TCmDbField;
      FFlgtiposaldo: TCmDbField;
      FFlgverificasaldo: TCmDbField;
      FTipocod2: TCmDbField;
      FIdcontaorcpara: TCmDbField;
      FTipocod4: TCmDbField;
      FIdplanoorcamen: TCmDbField;
      FTamcod1: TCmDbField;
      FTipocod5: TCmDbField;
      FIdcontaorcde: TCmDbField;
      FTipocod6: TCmDbField;
      FTamcod6: TCmDbField;
    FTipocod8: TCmDbField;
    FTipocod7: TCmDbField;
    FTamcod8: TCmDbField;
    FTamcod7: TCmDbField;

      procedure SetFlgpermitetransf(const Value: TCmDbField);
      procedure SetFlgtiposaldo(const Value: TCmDbField);
      procedure SetFlgverificasaldo(const Value: TCmDbField);
      procedure SetIdcontaorcde(const Value: TCmDbField);
      procedure SetIdcontaorcpara(const Value: TCmDbField);
      procedure SetIdcontaorcresult(const Value: TCmDbField);
      procedure SetIdpessoa(const Value: TCmDbField);
      procedure SetIdplanoorcamen(const Value: TCmDbField);
      procedure SetMascgrupoorc(const Value: TCmDbField);
      procedure SetMoecodigo(const Value: TCmDbField);

      procedure SetTamcod1(const Value: TCmDbField);
      procedure SetTamcod2(const Value: TCmDbField);
      procedure SetTamcod3(const Value: TCmDbField);
      procedure SetTamcod4(const Value: TCmDbField);
      procedure SetTamcod5(const Value: TCmDbField);
      procedure SetTamcod6(const Value: TCmDbField);
      procedure SetTamcod7(const Value: TCmDbField);
      procedure SetTamcod8(const Value: TCmDbField);


      procedure SetTipocod1(const Value: TCmDbField);
      procedure SetTipocod2(const Value: TCmDbField);
      procedure SetTipocod3(const Value: TCmDbField);
      procedure SetTipocod4(const Value: TCmDbField);
      procedure SetTipocod5(const Value: TCmDbField);
      procedure SetTipocod6(const Value: TCmDbField);
      procedure SetTipocod7(const Value: TCmDbField);
      procedure SetTipocod8(const Value: TCmDbField);


   public

      property Idpessoa:         TCmDbField read FIdpessoa           write SetIdpessoa;

      property Moecodigo:        TCmDbField read FMoecodigo          write SetMoecodigo;
      property Mascgrupoorc:     TCmDbField read FMascgrupoorc       write SetMascgrupoorc;
      property Idplanoorcamen:   TCmDbField read FIdplanoorcamen     write SetIdplanoorcamen;
      property Idcontaorcresult: TCmDbField read FIdcontaorcresult   write SetIdcontaorcresult;
      property Idcontaorcpara:   TCmDbField read FIdcontaorcpara     write SetIdcontaorcpara;
      property Idcontaorcde:     TCmDbField read FIdcontaorcde       write SetIdcontaorcde;
      property Flgverificasaldo: TCmDbField read FFlgverificasaldo   write SetFlgverificasaldo;
      property Flgtiposaldo:     TCmDbField read FFlgtiposaldo       write SetFlgtiposaldo;
      property Flgpermitetransf: TCmDbField read FFlgpermitetransf   write SetFlgpermitetransf;

      property Tipocod1:         TCmDbField read FTipocod1           write SetTipocod1;
      property Tipocod2:         TCmDbField read FTipocod2           write SetTipocod2;
      property Tipocod3:         TCmDbField read FTipocod3           write SetTipocod3;
      property Tipocod4:         TCmDbField read FTipocod4           write SetTipocod4;
      property Tipocod5:         TCmDbField read FTipocod5           write SetTipocod5;
      property Tipocod6:         TCmDbField read FTipocod6           write SetTipocod6;
      property Tipocod7:         TCmDbField read FTipocod7           write SetTipocod7;
      property Tipocod8:         TCmDbField read FTipocod8           write SetTipocod8;

      property Tamcod1:          TCmDbField read FTamcod1            write SetTamcod1;
      property Tamcod2:          TCmDbField read FTamcod2            write SetTamcod2;
      property Tamcod3:          TCmDbField read FTamcod3            write SetTamcod3;
      property Tamcod4:          TCmDbField read FTamcod4            write SetTamcod4;
      property Tamcod5:          TCmDbField read FTamcod5            write SetTamcod5;
      property Tamcod6:          TCmDbField read FTamcod6            write SetTamcod6;
      property Tamcod7:          TCmDbField read FTamcod7            write SetTamcod7;
      property Tamcod8:          TCmDbField read FTamcod8            write SetTamcod8;


      constructor Create(Aowner: TCmCustomCdbObject); Override;

      function Insert: Boolean; Override;

   end;



implementation

{ TDbParamorcamento }



constructor TDbParamorcamento.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;

   ErrorIfNoRowsAffected := False;

   TableName := 'PARAMORCAMENTO';

   fIdpessoa            := CreateCmDbField('IDPESSOA',         ftfloat,  True,  True,  False, True, '');

   fMoecodigo           := CreateCmDbField('MOECODIGO',        ftfloat,  False, False, False, True, '');
   fMascgrupoorc        := CreateCmDbField('MASCGRUPOORC',     ftString, False, False, False, True, '');
   fIdplanoorcamen      := CreateCmDbField('IDPLANOORCAMEN',   ftfloat,  False, False, False, True, '');
   fIdcontaorcresult    := CreateCmDbField('IDCONTAORCRESULT', ftString, False, False, False, True, '');
   fIdcontaorcpara      := CreateCmDbField('IDCONTAORCPARA',   ftString, False, False, False, True, '');
   fIdcontaorcde        := CreateCmDbField('IDCONTAORCDE',     ftString, False, False, False, True, '');
   fFlgverificasaldo    := CreateCmDbField('FLGVERIFICASALDO', ftString, False, False, False, True, '');
   fFlgtiposaldo        := CreateCmDbField('FLGTIPOSALDO',     ftString, False, False, False, True, '');
   fFlgpermitetransf    := CreateCmDbField('FLGPERMITETRANSF', ftString, False, False, False, True, '');

   fTamcod1             := CreateCmDbField('TAMCOD1',          ftfloat,  False, False, False, True, '');
   fTamcod2             := CreateCmDbField('TAMCOD2',          ftfloat,  False, False, False, True, '');
   fTamcod3             := CreateCmDbField('TAMCOD3',          ftfloat,  False, False, False, True, '');
   fTamcod4             := CreateCmDbField('TAMCOD4',          ftfloat,  False, False, False, True, '');
   fTamcod5             := CreateCmDbField('TAMCOD5',          ftfloat,  False, False, False, True, '');
   fTamcod6             := CreateCmDbField('TAMCOD6',          ftfloat,  False, False, False, True, '');
   fTamcod7             := CreateCmDbField('TAMCOD7',          ftfloat,  False, False, False, True, '');
   fTamcod8             := CreateCmDbField('TAMCOD8',          ftfloat,  False, False, False, True, '');

   fTipocod1            := CreateCmDbField('FLGTIPOCOD1',      ftfloat,  False, False, False, True, '');
   fTipocod2            := CreateCmDbField('FLGTIPOCOD2',      ftfloat,  False, False, False, True, '');
   fTipocod3            := CreateCmDbField('FLGTIPOCOD3',      ftfloat,  False, False, False, True, '');
   fTipocod4            := CreateCmDbField('FLGTIPOCOD4',      ftfloat,  False, False, False, True, '');
   fTipocod5            := CreateCmDbField('FLGTIPOCOD5',      ftfloat,  False, False, False, True, '');
   fTipocod6            := CreateCmDbField('FLGTIPOCOD6',      ftfloat,  False, False, False, True, '');
   fTipocod7            := CreateCmDbField('FLGTIPOCOD7',      ftfloat,  False, False, False, True, '');
   fTipocod8            := CreateCmDbField('FLGTIPOCOD8',      ftfloat,  False, False, False, True, '');
end;



function TDbParamorcamento.Insert: Boolean;
begin
   fIdpessoa.AsFloat := GetSequence('PARAMORCAMENTO');

   Result := Inherited Insert;
end;


procedure TDbParamorcamento.SetFlgpermitetransf(const Value: TCmDbField);
begin
   FFlgpermitetransf := Value;
end;



procedure TDbParamorcamento.SetFlgtiposaldo(const Value: TCmDbField);
begin
   FFlgtiposaldo := Value;
end;



procedure TDbParamorcamento.SetFlgverificasaldo(const Value: TCmDbField);
begin
   FFlgverificasaldo := Value;
end;



procedure TDbParamorcamento.SetIdcontaorcde(const Value: TCmDbField);
begin
   FIdcontaorcde := Value;
end;



procedure TDbParamorcamento.SetIdcontaorcpara(const Value: TCmDbField);
begin
   FIdcontaorcpara := Value;
end;



procedure TDbParamorcamento.SetIdcontaorcresult(const Value: TCmDbField);
begin
   FIdcontaorcresult := Value;
end;



procedure TDbParamorcamento.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;



procedure TDbParamorcamento.SetIdplanoorcamen(const Value: TCmDbField);
begin
   FIdplanoorcamen := Value;
end;



procedure TDbParamorcamento.SetMascgrupoorc(const Value: TCmDbField);
begin
   FMascgrupoorc := Value;
end;



procedure TDbParamorcamento.SetMoecodigo(const Value: TCmDbField);
begin
   FMoecodigo := Value;
end;



procedure TDbParamorcamento.SetTamcod1(const Value: TCmDbField);
begin
   FTamcod1 := Value;
end;



procedure TDbParamorcamento.SetTamcod2(const Value: TCmDbField);
begin
   FTamcod2 := Value;
end;



procedure TDbParamorcamento.SetTamcod3(const Value: TCmDbField);
begin
   FTamcod3 := Value;
end;



procedure TDbParamorcamento.SetTamcod4(const Value: TCmDbField);
begin
   FTamcod4 := Value;
end;



procedure TDbParamorcamento.SetTamcod5(const Value: TCmDbField);
begin
   FTamcod5 := Value;
end;



procedure TDbParamorcamento.SetTamcod6(const Value: TCmDbField);
begin
   FTamcod6 := Value;
end;



procedure TDbParamorcamento.SetTamcod7(const Value: TCmDbField);
begin
  FTamcod7 := Value;
end;

procedure TDbParamorcamento.SetTamcod8(const Value: TCmDbField);
begin
  FTamcod8 := Value;
end;

procedure TDbParamorcamento.SetTipocod1(const Value: TCmDbField);
begin
   FTipocod1 := Value;
end;



procedure TDbParamorcamento.SetTipocod2(const Value: TCmDbField);
begin
   FTipocod2 := Value;
end;



procedure TDbParamorcamento.SetTipocod3(const Value: TCmDbField);
begin
   FTipocod3 := Value;
end;



procedure TDbParamorcamento.SetTipocod4(const Value: TCmDbField);
begin
   FTipocod4 := Value;
end;



procedure TDbParamorcamento.SetTipocod5(const Value: TCmDbField);
begin
   FTipocod5 := Value;
end;



procedure TDbParamorcamento.SetTipocod6(const Value: TCmDbField);
begin
   FTipocod6 := Value;
end;



procedure TDbParamorcamento.SetTipocod7(const Value: TCmDbField);
begin

end;

procedure TDbParamorcamento.SetTipocod8(const Value: TCmDbField);
begin

end;

end.
