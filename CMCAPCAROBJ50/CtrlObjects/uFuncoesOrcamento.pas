Unit uFuncoesOrcamento;

Interface

Uses
  uCMTypes, uCmControlObject, FTelaAut, fAguardeOrc, uCtrlPadroes, Dialogs;

Function  TrocaVPP( Numero : String ) : String;
Procedure MostraStatusRelatGrupo     ( pMensagem : String );
Procedure MostraStatusRelatGrupoCCust( pMensagem : String );
Procedure MostraStatusRelatGrupoCResp( pMensagem : String );
Procedure MostraStatusRelatGrupoAnual( pMensagem : String );
Procedure MostraStatusRelatRateioPlano( pMensagem : String );
Procedure MostraStatusRelatPlanoTrabalho( pMensagem : String );
Var
  FormStatusRelatGrupo,
  FormStatusRelatGrupoCCust,
  FormStatusRelatGrupoCResp,
  FormStatusRelatGrupoAnual,
  FormStatusRelatRateioPlano,
  FormStatusRelatPlanoTrabalho : TfrmAguardeOrc;

Implementation
//************************************************
Procedure MostraStatusRelatGrupo( pMensagem : String );
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
Procedure MostraStatusRelatGrupoCCust( pMensagem : String );
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
Procedure MostraStatusRelatGrupoCResp( pMensagem : String );
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
Procedure MostraStatusRelatGrupoAnual( pMensagem : String );
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
Procedure MostraStatusRelatRateioPlano( pMensagem : String );
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
Procedure MostraStatusRelatPlanoTrabalho( pMensagem : String );
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
Function  TrocaVPP( Numero : String ) : String;
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
