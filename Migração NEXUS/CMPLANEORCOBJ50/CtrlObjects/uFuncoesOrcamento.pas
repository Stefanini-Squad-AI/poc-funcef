// Alterações:
{
-----------------------------------------------------------------------------
 Nº SOL......: 172384/9603
 Nº KINTANA..: 1661662
 Data........: 13/09/2012
 Responsável.: Vander Campos
 Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}
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
   CMDBLookupCombo,
   Messages, Classes, Graphics, Controls, StdCtrls,
   Forms, uCMTypes, uCmControlObject, FTelaAut, fAguardeOrc, uCtrlPadroes,
   Dialogs, wwQuery, uDiasUteis,
   uDataBase, SysUtils, dBaseDados, uSistema,
   DbClient;

const
  CR = #13;
  LF = #10;
  CR_LF = CR+LF;

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

  function GravaLogPLANEORC(psDescOperacao: string; IdModulo, IdUsuario: integer) : boolean;

  function  EncontrouDiferenca: string;

  procedure GravarLOGLocal(psDescOperacao: string; IdModulo, IdUsuario: integer);

  //INICIO - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662  
  Procedure ClearFilters(AForm   : TForm; AParent : TWinControl);
  Function StrToDateDef(ADateStr : String; ADefault : TDateTime = 0) : TDateTime;Overload;
  //INICIO - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662

var
  FormStatusRelatGrupo,
  FormStatusRelatGrupoCCust,
  FormStatusRelatGrupoCResp,
  FormStatusRelatGrupoAnual,
  FormStatusRelatRateioPlano,
  FormStatusRelatPlanoTrabalho : TfrmAguardeOrc;


implementation

uses uCtrlSaldoOrcado;

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

function GravaLogPLANEORC(psDescOperacao: string; IdModulo, IdUsuario: integer): boolean;
var
  iIdLogTotalPREV : longint;
  TextoLOG : string;
begin
  Result := False;

  iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');

  if Trim(psDescOperacao) = '' then psDescOperacao := 'Não Identificada';

  with dtmBaseDados.qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO LOGTOTALPREV (IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA2) '+
              ' VALUES ('+IntToStr(iIdLogTotalPREV) +', '+
                          IntToStr(IdModulo)        +', '+
                          '''' + Copy(psDescOperacao, 1, 200) + ''','+
                          IntToStr(IdUsuario)       +', '+
                          ' SYSDATE, 52 )');
      try
        ExecSQL;
      except
        Result := False;
      end;
    end;

  Result := True;
end;

function EncontrouDiferenca: string;
var
  CdsAux    : TClientDataSet;
  sSql      : String;
  CompoDias : TDiasUteis;
  Objeto    : TCtrlSaldoOrcado;

begin
  try
    Objeto    := TCtrlSaldoOrcado.Create;
    CompoDias := TDiasUteis.Create;
    
    Objeto.InitializeAs(Padroes);

    CdsAux := TClientDataSet.Create(nil);
    Result := '';

    sSql := 'SELECT RESERVA.IDCONTAORCAMEN, ' +
            '       VALORRESERVA, ' +
            '       VALORCOMP, ' +
            '       (VALORCOMP - VALORRESERVA) AS DIFERENCA ' +

            '  FROM ' +

            // MONTA TABELA RESERVA
            '       (SELECT R.IDCONTAORCAMEN, ' +
            '               SUM(DECODE(FLGRESCOMP, ''C'', DECODE(FLGRESERVA, ''E'', VLRCOMPROMISSO, ' +
            '                                                                ''A'', DECODE(VLRCOMPROMISSO, 0, VLRRESERVA, ' +
            '                                                                                             ABS(VLRRESERVA) ' +
            '                                                                          ) ' +
            '                                                    ), ' +
            '                                             DECODE(FLGRESERVA, ''A'', VLRRESERVA, ' +
            '                                                                ''U'', VLRRESERVA, ' +
            '                                                                  0) ' +
            '                          ) ' +
            '                   ) AS VALORRESERVA ' +
            '          FROM RESERVAORCAMEN R ' +
            '         WHERE EXERCICIO = ' + FormatDateTime('YYYY',Date) +
            '         GROUP BY IDCONTAORCAMEN) RESERVA, ' +
            '       (SELECT S.IDCONTAORCAMEN, ' +
            '               SUM(nvl(VLRCOMPROMETIDO,0) + nvl(VLRRESERVADO,0)) AS VALORCOMP ' +
            '          FROM SALDOORCADO S ' +
            '         WHERE EXERCICIO = ' + FormatDateTime('YYYY',Date) +
            '         GROUP BY IDCONTAORCAMEN) SALDO ' +
            // FILTROS DA QUERY PRINCIPAL
            ' WHERE (RESERVA.IDCONTAORCAMEN = SALDO.IDCONTAORCAMEN) ' +
            '   AND (ABS(VALORRESERVA) <> ABS(VALORCOMP)) ' +
            ' ORDER BY RESERVA.IDCONTAORCAMEN ';

     try
       CdsAux.Data := Objeto.GetDataPacket(sSql);

       if CdsAux.IsEmpty then
         Result := 'CONTAS ORÇAMENTÁRIAS SEM DIFERENÇAS NOS SALDOS!'
       else
       begin
         CdsAux.First;
         while not CdsAux.Eof do
         begin
           // Monta uma STRING com as contas orçamentárias que possuem diferenças
           if Result = '' then
             Result := CdsAux.FieldByName('IDCONTAORCAMEN').AsString + '=>' + CdsAux.FieldByName('DIFERENCA').AsString
           else
             Result := Result + ', ' + CdsAux.FieldByName('IDCONTAORCAMEN').AsString + '=>' + CdsAux.FieldByName('DIFERENCA').AsString;

           // Executa o método AcertaSaldo
           if not Objeto.AcertaSaldoConfirmaClick(Sistema.IdEmpresa,
                                                  CdsAux.FieldByName('IDCONTAORCAMEN').AsString,
                                                  CompoDias.ExtraiAno(now),
                                                  CompoDias.ExtraiMes(now),
                                                  CompoDias.ExtraiMes(now)) then
           begin
             Result := Result + '...NEAS';
           end;

           CdsAux.Next;
         end
       end;

     except
       Result := 'ERRO na execução da Query de apuração de divergências de saldos!';
     end;


  finally
    FreeAndNil(CdsAux);
    FreeAndNil(Objeto);
    FreeAndNil(CompoDias);
  end;
end;





procedure GravarLOGLocal(psDescOperacao: string; IdModulo, IdUsuario: integer);
var
  iIdLogTotalPREV : longint;

begin
  iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');

  with dtmBaseDados.qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO LOGTOTALPREV (IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA2) '+
              ' VALUES ('+IntToStr(iIdLogTotalPREV) +', '+
                          IntToStr(IdModulo)        +', '+
                          '''' + Copy(psDescOperacao, 1, 200) + ''','+
                          IntToStr(IdUsuario)       +', '+
                          ' SYSDATE, 52 )');
      ExecSQL;
    end;
end;


Procedure ClearFilters(AForm : TForm; AParent : TWinControl);
Var
  I : Integer;
begin

  For i := 0 To AForm.ComponentCount - 1 do
    if (TWinControl(AForm.Components[I]).Parent = AParent)   Then
       if (AForm.Components[I].ClassType = TCMDBLookupCombo) Then
          TCMDBLookupCombo(AForm.Components[I]).LookupValue := ''
       Else if (AForm.Components[I].ClassType = TEdit) Then
               TEdit(AForm.Components[I]).Clear
       Else if (AForm.Components[I].ClassType = TMemo) Then
               TMemo(AForm.Components[I]).Lines.Clear;

End;

Function StrToDateDef(ADateStr : String; ADefault : TDateTime) : TDateTime;
Begin
  Try
    Result := StrToDate(ADateStr);
  Except
    Result := ADefault;
  End;
End;

End.
