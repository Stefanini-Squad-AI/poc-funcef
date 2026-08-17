// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : ...FormProgresso
Data      : -
Autor     : André Pontes
Pendencia :
Descrição : Em função de incompatibilidade com outros sistemas, foram retiradas as funções de
            manipulação do form de progressão, que ficam agora no próprio  
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : -
Autor     : André Pontes
Pendencia :
Descrição : Criadas as funçoes de manipulação de strings e manipulação dos forms de progresso.
---------------------------------------------------------------------------------------------------}

unit uFuncoesOrcamento;

interface

uses
   Forms, uCMTypes, uCmControlObject, FTelaAut, fAguardeOrc, uCtrlPadroes, Dialogs, wwQuery;

   // manipulação de Strings -----------------------------------------------------------------------
   function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   // ----------------------------------------------------------------------------------------------

   // manipulação de TwwQueries --------------------------------------------------------------------
   procedure LimpaParametros(const qry: TwwQuery);
   // ----------------------------------------------------------------------------------------------


   function  TrocaVPP( Numero : String ) : String;
   procedure MostraStatusRelatGrupo     ( pMensagem : String );
   procedure MostraStatusRelatGrupoCCust( pMensagem : String );
   procedure MostraStatusRelatGrupoCResp( pMensagem : String );
   procedure MostraStatusRelatGrupoAnual( pMensagem : String );
   procedure MostraStatusRelatRateioPlano( pMensagem : String );
   procedure MostraStatusRelatPlanoTrabalho( pMensagem : String );

var
   FormStatusRelatGrupo,
   FormStatusRelatGrupoCCust,
   FormStatusRelatGrupoCResp,
   FormStatusRelatGrupoAnual,
   FormStatusRelatRateioPlano,
   FormStatusRelatPlanoTrabalho : TfrmAguardeOrc;



implementation




//==================================================================================================
//    Manipulação de TQueries
//==================================================================================================

// Fecha, prepara uma TwwQuery e atribui todos os parâmetros como NULL, inicialmente
procedure LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do
   begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;

//==================================================================================================
//    FIM Manipulação de TQueries
//==================================================================================================



// =================================================================================================
//    Manipulação de Strings
// =================================================================================================

function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sAux + sOriginal), (length((sAux + sOriginal)) - (iLimiteTamanho - 1)), iLimiteTamanho);
end;

function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sOriginal + sAux), 1, iLimiteTamanho);
end;

// =================================================================================================
//    FIM Manipulação de Strings
// =================================================================================================



//************************************************
procedure MostraStatusRelatGrupo( pMensagem : String );
Begin

  If ( FormStatusRelatGrupo = Nil ) Then Begin

    FormStatusRelatGrupo := TfrmAguardeOrc.Create( Nil  );

  End Else Begin

    FormStatusRelatGrupo.BringToFront;
  End;

  If ( pMensagem = '' ) Then Begin

    FormStatusRelatGrupo.Apaga;

  End Else Begin

    FormStatusRelatGrupo.Mostra( pMensagem );
  End;
End;
//************************************************
procedure MostraStatusRelatGrupoCCust( pMensagem : String );
Begin

  If ( FormStatusRelatGrupoCCust = Nil ) Then Begin

    FormStatusRelatGrupoCCust := TfrmAguardeOrc.Create( Nil  );

  End Else Begin

    FormStatusRelatGrupoCCust.BringToFront;
  End;

  If ( pMensagem = '' ) Then Begin

    FormStatusRelatGrupoCCust.Apaga;

  End Else Begin

    FormStatusRelatGrupoCCust.Mostra( pMensagem );
  End;
End;
//************************************************
procedure MostraStatusRelatGrupoCResp( pMensagem : String );
Begin

  If ( FormStatusRelatGrupoCResp = Nil ) Then Begin

    FormStatusRelatGrupoCResp := TfrmAguardeOrc.Create( Nil  );

  End Else Begin

    FormStatusRelatGrupoCResp.BringToFront;
  End;

  If ( pMensagem = '' ) Then Begin

    FormStatusRelatGrupoCResp.Apaga;

  End Else Begin

    FormStatusRelatGrupoCResp.Mostra( pMensagem );
  End;
End;
//************************************************
procedure MostraStatusRelatGrupoAnual( pMensagem : String );
Begin

  If ( FormStatusRelatGrupoAnual = Nil ) Then Begin

    FormStatusRelatGrupoAnual := TfrmAguardeOrc.Create( Nil  );

  End Else Begin

    FormStatusRelatGrupoAnual.BringToFront;
  End;

  If ( pMensagem = '' ) Then Begin

    FormStatusRelatGrupoAnual.Apaga;

  End Else Begin

    FormStatusRelatGrupoAnual.Mostra( pMensagem );
  End;
End;
//************************************************
procedure MostraStatusRelatRateioPlano( pMensagem : String );
Begin

  If ( FormStatusRelatRateioPlano = Nil ) Then Begin

    FormStatusRelatRateioPlano := TfrmAguardeOrc.Create( Nil  );

  End Else Begin

    FormStatusRelatRateioPlano.BringToFront;
  End;

  If ( pMensagem = '' ) Then Begin

    FormStatusRelatRateioPlano.Apaga;

  End Else Begin

    FormStatusRelatRateioPlano.Mostra( pMensagem );
  End;
End;
//************************************************
procedure MostraStatusRelatPlanoTrabalho( pMensagem : String );
Begin
  If ( FormStatusRelatPlanoTrabalho = Nil ) Then Begin

    FormStatusRelatPlanoTrabalho := TfrmAguardeOrc.Create( Nil  );

  End Else Begin

    FormStatusRelatPlanoTrabalho.BringToFront;
  End;

  If ( pMensagem = '' ) Then Begin

    FormStatusRelatPlanoTrabalho.Apaga;

  End Else Begin

    FormStatusRelatPlanoTrabalho.Mostra( pMensagem );
  End;
End;
//************************************************
function  TrocaVPP( Numero : String ) : String;
Var
  ilength,
  ipos        : integer;
  novonumero,
  spos        : string;
Begin
  ilength := Length( numero );

  novonumero := '';
  ipos := 0;
  While ipos < ilength do begin
    ipos := ipos + 1;
    spos := copy(numero,ipos,1);
    if spos = ',' then
      novonumero := novonumero + '.'
    else
      novonumero := novonumero + spos;
  end;
  Result := novonumero
end;
//************************************************
End.
