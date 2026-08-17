// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Fernando Santana
// Pendencia   : Kintana 929902 sol 143267
// Data        : 13/09/2010
// Alteração   : Buscar o valor do 'IDNUCLEOFAMILIAR'
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 12/01/2008
// Alteração   : Informar caso beneficio tenha sido movimentado após saldamento
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 28/11/2006
// Alteração   : 1) Trocar pesquisa do emprestimo, de IDPESSOA para IDBENEF
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/10/2006
// Pendencia   : 23650
// Alteração   : Voltar TMPDESC para plano antigo  no desfazer Ativo     
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 06/10/2006
// Alteração   : Tirei os IDPLANOORIGEM
// Data        : 05/09/2006
// Pendência   : 22846
// Rotina      : DesfazSaldamentoAssistido
// Alteração   : Alteração para suportar desfazer pensionistas
//------------------------------------------------------------------------------
unit FCancSaldamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, dBaseDados,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, uCmControlObject, uSistema,
  DBTables, Wwquery, UMensErro, Spin, fcLabel, TREdit, uCtrlPadroes,
  fcButton, fcImgBtn, ComCtrls, FOkCancelar, MontaSelect;

type


   TfrmCancSaldamento = class(TfrmOkCancelar)

      LblTitulo: TfcLabel;
      qryContribuicao: TwwQuery;
      Label2: TLabel;
      edtNome: TEdit;
      edtMatricula: TEdit;
      Label8: TLabel;
      btnBuscaPart: TBitBtn;
    MS_Part: TMontaSelect;
      qrySaldamento: TwwQuery;
    MS_Part1: TMontaSelect;
    qryEVENTOSPREV: TwwQuery;
    qryHSTCONTEVENTOSPR: TwwQuery;
    qryBeneficiarios: TwwQuery;
    qryMOVBENEF: TwwQuery;
    qryHSTBENEFBFCIARIO: TwwQuery;
    qryCONTRIBPREVPARTP: TwwQuery;
    qryHSTCONTRIBPREV: TwwQuery;
    qryPARTPREVPLAN: TwwQuery;
    qryMOVBENEFLOTE: TwwQuery;

      procedure bbtnConfirmarClick(Sender: TObject);
      procedure btnBuscaPartClick(Sender: TObject);


   private  // Private declarations

      IDPessoa    : Int64;
      IDTitular   : Int64;
      IDPlanoPrev : Int64;
      IDPatro     : Int64;
      flgInterno  : String;

      function  VerificaPreenchimento: Boolean;

      function  DesfazSaldamentoAtivo(const IDPessoa     : Int64): String;

      function  DesfazSaldamentoAssistido(const IDPessoa  : Int64;
                                          const IDtitular : Int64): String;

   public   // Public declarations

   end;



var
  frmCancSaldamento: TfrmCancSaldamento;



implementation
{$R *.DFM}
uses
   uDataBase, uVerificaPreenchimento;

procedure TfrmCancSaldamento.bbtnConfirmarClick(Sender: TObject);
Var
   msgErro : String;
begin
   inherited;

   // ----------------------------------------------------------------------------------------------

   //  if not(VerificaPreenchimento) then Exit;

   // ----------------------------------------------------------------------------------------------


   if (flgInterno = 'AT') or (flgInterno = 'MA') or (flgInterno = 'MP') or (flgInterno = 'MS') or (flgInterno = 'MT') then
   begin

     if MsgDlg('Deseja realmente desfazer o saldamento do participante ATIVO indicado?',
               'Módulo Funcef', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

     Repaint;

     msgErro := DesfazSaldamentoAtivo(IDPessoa)

   end else if ( flgInterno = 'AS' ) then begin

     if MsgDlg('Deseja realmente desfazer o saldamento do participante APOSENTADO indicado?',
               'Módulo Funcef', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

     Repaint;

     msgErro := DesfazSaldamentoAssistido(IDPessoa, IDTitular)

   end else if ( flgInterno = 'CA' ) then begin

     if MsgDlg('Deseja realmente desfazer o saldamento do PENSIONISTA indicado?',
               'Módulo Funcef', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

     Repaint;

     msgErro := DesfazSaldamentoAssistido(IDPessoa, IDTitular)

   end;

   If msgErro <> ''
   Then MsgDlg(msgErro, 'Módulo Funcef', mtError, [mbOk], 0)
   Else MsgDlg('Saldamento desfeito.', 'Módulo Funcef', mtInformation, [mbOk], 0);

   // ----------------------------------------------------------------------------------------------

   IDPessoa    := -1;
   IDTitular   := -1;
   IDPlanoPrev := -1;
   IDPatro     := -1;
   flgInterno  := '';

   edtMatricula.Clear;
   edtNome.Clear;

   // ----------------------------------------------------------------------------------------------
end;



function TfrmCancSaldamento.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      // Verifica se foi selecionado um participante
      if (length(trim(edtMatricula.Text)) = 0) or (length(trim(edtNome.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar o Participante!', btnBuscaPart);

      // -------------------------------------------------------------------------------------------

      // Verifica se já há contribuições pagas
      with qryContribuicao do
      begin
         qryContribuicao.Close;
         if not(Prepared) then Prepare;
         ParamByName('PIDPLANOPREV').AsInteger  := IDPlanoPrev;
         ParamByName('PIDPESSJUR').AsInteger    := IDPatro;
         ParamByName('PIDPESSOA').AsInteger     := IDPessoa;
         Open;

         if not(isEmpty) then
         begin
            Close;
            raise EValidacao.CreateVal('O participante possui contribuições já recebidas!', bbtnConfirmar);
         end;

         Close;
      end;

      // -------------------------------------------------------------------------------------------

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Módulo Funcef', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmCancSaldamento.btnBuscaPartClick(Sender: TObject);
begin
   inherited;

   MS_Part.Executar;

   Repaint;

   if MS_Part.RetornouValor then
   begin
      Screen.Cursor     := crHourGlass;

      IDPessoa          := StrToInt(MS_Part.ValoresChave[0]);
      IDTitular         := StrToInt(MS_Part.ValoresChave[5]);
  //    IDPlanoPrev       := StrToInt(MS_Part.ValoresChave[2]);
      IDPatro           := StrToInt(MS_Part.ValoresChave[1]);
      flgInterno        := MS_Part.ValoresChave[4];

      edtMatricula.Text := MS_Part.ValoresChave[2];
      edtNome.Text      := MS_Part.ValoresChave[3];
   end;

   if btnBuscaPart.CanFocus then btnBuscaPart.SetFocus;

   Screen.Cursor  := crDefault;
end;



function TfrmCancSaldamento.DesfazSaldamentoAtivo(const IDPessoa     : Int64): String;
var
   sSQL, sErro : String;
begin
   StartTransacao;

   try
      // -------------------------------------------------------------------------------------------

      sErro := 'Erro ao excluir contribuições associadas ao participante no saldamento';
      sSQL  :=
      'DELETE FROM CONTRIBPREVPARTP WHERE IDPESSOA = ' + FormatFloat('#0', IDPessoa) + ' AND IDPLANOPREV = 74';

      qrySaldamento.Close;
      qrySaldamento.SQL.Clear;
      qrySaldamento.SQL.Text := sSQL;
      qrySaldamento.ExecSQL;

      // -------------------------------------------------------------------------------------------

      sErro := 'Erro ao excluir Reservas associadas ao participante no saldamento';
      sSQL  :=
      'DELETE FROM RESERVAPART WHERE IDPESSOA = ' + FormatFloat('#0', IDPessoa) + ' AND IDPLANOPREV = 74';

      qrySaldamento.Close;
      qrySaldamento.SQL.Clear;
      qrySaldamento.SQL.Text := sSQL;
      qrySaldamento.ExecSQL;

      // -------------------------------------------------------------------------------------------

      sErro := 'Erro ao excluir contribuições associadas ao evento de saldamento';
      sSQL  :=
      'DELETE FROM HSTCONTEVENTOSPR '                                               + #13 +
      'WHERE '                                                                      + #13 +
      '   IDEVENTOSPREV IN ( '                                                      + #13 +
      '                    SELECT '                                                 + #13 +
      '                       IDEVENTOSPREV '                                       + #13 +
      '                    FROM '                                                   + #13 +
      '                       EVENTOSPREV '                                         + #13 +
      '                    WHERE '                                                  + #13 +
      '                           IDPESSOA     = ' + FormatFloat('#0', IDPessoa)    + #13 +
      '                       AND (IDPLANOPREV = 74 OR IDEVENTOGERADOR = 338) '     + #13 +
      '                    ) ';

      qrySaldamento.Close;
      qrySaldamento.SQL.Clear;
      qrySaldamento.SQL.Text := sSQL;
      qrySaldamento.ExecSQL;

      // -------------------------------------------------------------------------------------------

      sErro := 'Erro ao excluir evento de saldamento';
      sSQL :=
      'DELETE FROM EVENTOSPREV '                               + #13 +
      'WHERE '                                                 + #13 +
      '       IDPESSOA     = ' + FormatFloat('#0', IDPessoa)   + #13 +
      '   AND (IDPLANOPREV = 74 OR IDEVENTOGERADOR = 338) ';

      qrySaldamento.Close;
      qrySaldamento.SQL.Clear;
      qrySaldamento.SQL.Text := sSQL;
      qrySaldamento.ExecSQL;

      // -------------------------------------------------------------------------------------------

      sErro := 'Erro ao excluir dados previdenciários do novo plano';
      sSQL  :=
      'DELETE FROM PARTPREVPLAN WHERE IDPESSOA = ' + FormatFloat('#0', IDPessoa) + ' AND IDPLANOPREV = 74';

      qrySaldamento.Close;
      qrySaldamento.SQL.Clear;
      qrySaldamento.SQL.Text := sSQL;
      qrySaldamento.ExecSQL;

      // -------------------------------------------------------------------------------------------

      sErro := 'Erro ao atualizar dados previdenciários do novo anterior';
      sSQL  :=
      'UPDATE '                                                + #13 +
      '   PARTPREVPLAN '                                       + #13 +
      'SET '                                                   + #13 +
      '   IDSITPLANOPREV = 1, '                                + #13 +
      '   DATACANCELAMENTO = NULL, '                           + #13 +
      '   FLGDESATIVADO    = 0 '                               + #13 +
      'WHERE '                                                 + #13 +
      '       IDPESSOA     = ' + FormatFloat('#0', IDPessoa)   + #13 +
      '   AND IDPLANOPREV  = 2';

      qrySaldamento.Close;
      qrySaldamento.SQL.Clear;
      qrySaldamento.SQL.Text := sSQL;
      qrySaldamento.ExecSQL;

      // -------------------------------------------------------------------------------------------

      sErro := 'Erro ao atualizar dados das contribuições associadas ao participante no saldamento';
      sSQL  :=
      'UPDATE '                                                + #13 +
      '   CONTRIBPREVPARTP '                                   + #13 +
      'SET '                                                   + #13 +
      '   FLGCOBRA         = 1, '                              + #13 +
      '   DATAFINAL        = NULL '                            + #13 +
      'WHERE '                                                 + #13 +
      '       IDPESSOA     = ' + FormatFloat('#0', IDPessoa)   + #13 +
      '   AND IDPLANOPREV  = 2';

      qrySaldamento.Close;
      qrySaldamento.SQL.Clear;
      qrySaldamento.SQL.Text := sSQL;
      qrySaldamento.ExecSQL;

      // -------------------------------------------------------------------------------------------

      { Atualizando TMPDESC }
      qrySaldamento.SQL.Clear;
      qrySaldamento.SQL.Add(' UPDATE TMPDESC SET                       ');
      qrySaldamento.SQL.Add('    IDPLANOPREV =    ' + IntToStr( 2 ) );
      qrySaldamento.SQL.Add(' WHERE IDPESSOA     = ' + IntToStr( IDPessoa ) );
      qrySaldamento.SQL.Add('   AND IDTITULAR    = ' + IntToStr( IDPessoa ) );
      qrySaldamento.SQL.Add('   AND SITENVIO     = ''0'''  );
      qrySaldamento.SQL.Add('   AND FLGDESCFOLHA = ''B'' ');
      qrySaldamento.ExecSQL;

      qrySaldamento.SQL.Clear;
      qrySaldamento.SQL.Add(' UPDATE CONTRATOEMPTMO SET IDPLANOPREV = '+ IntToStr( 2 )  +
                            ' WHERE  IDPATRO     = '+ IntToStr( 91008 )  +
                            ' AND    IDPLANOPREV = '+ IntToStr( 74 ) +
                            ' AND    IDBENEF     = '+ IntToStr( IDPessoa ) ) ;
      qrySaldamento.ExecSQL;

      // -------------------------------------------------------------------------------------------

      CommitTransacao;

      sErro := '';

      Result := sErro;
   except
      RollbackTransacao;
      Result := sErro;
   end;
end;

function TfrmCancSaldamento.DesfazSaldamentoAssistido(const IDPessoa, IDtitular: Int64): String;
Var
   sErro,
   sContribuicao, sContribSaldamento,
   sBeneficios, sDataMov, sDataCancelamento,
   sDataFinal, sDataFinalAnt : String;

   iIDEventosPrev,
   iIDPlanoPrev,
   iIDPlanAntigo,
   iIDSitFunc,
   iIDSitPart,
   iIDSitPlan,
   iIDBeneficio,
   iIdPessoa, iIdResponsavel, iIdNucleoFamiliar, iIdPlanoOrigem, 
   iIDLote,
   iIDBenefAntigo,
   iIdMovBenef,
   iNumeroProcesso : Integer;

   qryAux        : TwwQuery;
begin
   StartTransacao;

   try
      If qryAux = Nil Then qryAux := TwwQuery.Create(nil);
      qryAux.DatabaseName := 'BaseDados';

      { Localiza eventos de Saldamento }

      sErro := 'Não foi encontrado eventos de saldamento';

      qryEVENTOSPREV.Close;
      qryEVENTOSPREV.ParamByName('IDPESSOA').AsInteger  := IdTitular;
      qryEVENTOSPREV.Open;

      If Not qryEVENTOSPREV.IsEmpty Then Begin

        iIDEventosPrev := qryEVENTOSPREV.FieldByName('IDEVENTOSPREV').AsInteger;
        iIDPlanoPrev   := qryEVENTOSPREV.FieldByName('IDPLANOPREV').AsInteger;

        iIDSitFunc     := qryEVENTOSPREV.FieldByName('IDSITFUNCATUAL').AsInteger;
        iIDSitPart     := qryEVENTOSPREV.FieldByName('IDSITPARTATUAL').AsInteger;
        iIDSitPlan     := qryEVENTOSPREV.FieldByName('IDSITPLANOATUAL').AsInteger;

        sDataCancelamento := qryEVENTOSPREV.FieldByName('DATAVOLTA').AsString;

        { desassociar as Contribuições }
        sErro := 'Erro ao desassociar as contribuições do participante';

        {----------------------------}
        { Desfazendo as Contribuição }
        {----------------------------}

        qryHSTCONTEVENTOSPR.Close;
        qryHSTCONTEVENTOSPR.ParamByName('IDEVENTOSPREV').AsInteger := iIDEVENTOSPREV;
        qryHSTCONTEVENTOSPR.Open;

        sContribSaldamento := '259, 633, 500,';
        While not qryHSTCONTEVENTOSPR.EOF do Begin

           sContribuicao := qryHSTCONTEVENTOSPR.FieldByName('IDCONTRIBUICAOF').AsString;

           If qryHSTCONTEVENTOSPR.FieldByName('FLGASSOCIADA').AsInteger = 0 Then Begin

              iIDPlanAntigo := qryHSTCONTEVENTOSPR.FieldByName('IDPLANOPREVF').AsInteger;

              qryAux.SQL.Clear;
              qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA  = 1,   ');
              QRYAUX.SQL.ADD('                             DATAFINAL = NULL ');
              qryAux.SQL.Add(' WHERE IDPESSOA       = ' + IntToStr(IDPessoa));
              qryAux.SQL.Add('   AND IDPESSJUR      = 91008                ');
              qryAux.SQL.Add('   AND IDCONTRIBUICAO = ' + sContribuicao     );
              qryAux.ExecSQL;

           End Else Begin

              qryAux.SQL.Clear;
              qryAux.SQL.Add(' DELETE FROM CONTRIBPREVPARTP                ');
              qryAux.SQL.Add(' WHERE IDPESSOA       = ' + IntToStr(IDPessoa));
              qryAux.SQL.Add('   AND IDPESSJUR      = 91008                ');
              qryAux.SQL.Add('   AND IDCONTRIBUICAO = ' + sContribuicao     );
              qryAux.ExecSQL;
           End;

           sContribSaldamento := sContribSaldamento + sContribuicao + ', ';

           qryHSTCONTEVENTOSPR.Next;

        End;

        { excluindo a HSTCONTEVENTOSPR }
        sErro := 'Erro ao excluir o histórico de Eventos de contribuição';

        qryAux.SQL.Clear;
        qryAux.SQL.Add(' DELETE FROM HSTCONTEVENTOSPR                     ');
        qryAux.SQL.Add(' WHERE IDEVENTOSPREV = ' + IntToStr(iIDEVENTOSPREV));
        qryAux.ExecSQL;

        { Pensionista }
        If ( flgInterno = 'CA' ) Then Begin

          qryAux.SQL.Clear;
          qryAux.SQL.Add(' SELECT DISTINCT IDPLANOPREV FROM BENEFBFCIARIO ');
          qryAux.SQL.Add(' WHERE IDPLANOPREV <> ' + IntToStr( iIDPlanoPrev ) );
          qryAux.SQL.Add('   AND IDPESSOA    =  ' + IntToStr( IDPessoa ) );
          qryAux.SQL.Add('   AND IDPESSJUR   = 91008 ');
          qryAux.Open;

          If ( Not qryAux.IsEmpty )
          Then iIDPlanAntigo := QryAux.FieldByName('IDPLANOPREV').AsInteger
          Else iIDPlanAntigo := iIDPlanoPrev;


        End;

        If sContribSaldamento <> '' Then
           sContribSaldamento := Copy(sContribSaldamento, 1, Length(sContribSaldamento) - 2);

        { excluindo a EVENTOSPREV }
        sErro := 'Erro ao excluir os eventos de saldamento de saldamento';

        qryAux.SQL.Clear;
        qryAux.SQL.Add(' DELETE FROM EVENTOSPREV             ');
        qryAux.SQL.Add(' WHERE IDPESSOA        = ' + IntToStr( IdTitular ) );
        qryAux.SQL.Add('   AND IDEVENTOGERADOR = 339' );
        qryAux.ExecSQL;

        {--------------------------}
        { Desfazendo os Benefícios }
        {--------------------------}

        sErro := 'Não foi encontrado nenhum beneficiário';

        qryBeneficiarios.Close;
        qryBeneficiarios.ParamByName('IDTITULAR').AsInteger := IDTitular;
        qryBeneficiarios.ParamByName('IDPESSOA').AsInteger  := IDPessoa;
        qryBeneficiarios.Open;

        If Not qryBeneficiarios.IsEmpty Then Begin

          While ( Not qryBeneficiarios.Eof ) Do Begin

            iIdPessoa      := qryBeneficiarios.FieldByName('IDPESSOA').AsInteger;
            iIdResponsavel := qryBeneficiarios.FieldByName('IDRESPONSAVEL').AsInteger;
            iIdNucleoFamiliar := qryBeneficiarios.FieldByName('IDNUCLEOFAMILIAR').AsInteger;
            iIdPlanoOrigem    := qryBeneficiarios.FieldByName('IDPLANOORIGEM').AsInteger;

            { Localiza o idMovBenef }
            sErro := 'Erro ao buscar os dados da movimentação do benefício';

            qryMOVBENEF.Close;
            qryMOVBENEF.ParamByName('IDTITULAR').AsInteger   := IDTitular;
            qryMOVBENEF.ParamByName('IDPESSOA').AsInteger    := iIdPessoa;
            qryMOVBENEF.Open;

            { Cprev 12/01/2008                                            }

            { Informar caso último movimento de beneficio não tenha sido  }
            { relacionado ao saldamento.                                  }

            If ( qryMOVBENEF.isEmpty ) Then Begin

              If MsgDlg('Esse benefício foi movimentado após o saldamento. ' + #13 +
                        'Deseja realmente continuar o processo? ',
                        'Atenção', mtConfirmation, [mbYes, mbNo], 0) <> mrYes
              Then Begin

                Result := 'Erro ao desfazer saldamento; Benefício foi movimentado após saldamento';

                RollbackTransacao;

                Exit;

              End;

            End; { If ( qryMOVBENEF.isEmpty ) Then }


            While not qryMOVBENEF.EOF do Begin

              iIDLote         := qryMOVBENEF.FieldByName('IDLOTEMOV').AsInteger;
              iIdMovBenef     := qryMOVBENEF.FieldByName('IDMOVBENEF').AsInteger;
              sDataMov        := qryMOVBENEF.FieldByName('DATAMOV').AsString;
              iIDBeneficio    := qryMOVBENEF.FieldByName('IDBENEFICIO').AsInteger;
              iIDBenefAntigo  := qryMOVBENEF.FieldByName('IDBENEFICIO').AsInteger;
              iNumeroProcesso := qryMOVBENEF.FieldByName('NUMEROPROCESSO').AsInteger;

              { Verifica se o participante possui preparo na folha }
              sErro := 'Participante já possui um preparo na folha';

              qryAux.SQL.Clear;
              qryAux.Close;
              qryAux.SQL.Add(' SELECT                       ');
              qryAux.SQL.Add('   HB.MESREFERENCIA, HB.IDLOTE ');
              qryAux.SQL.Add(' FROM                          ');
              qryAux.SQL.Add('   HSTBENEFBFCIARIO HB, CTRLINTERFACE CI ');
              qryAux.SQL.Add(' WHERE HB.IDLOTE = CI.IDLOTE             ');
              qryAux.SQL.Add('   AND HB.FLGCONCESSAO = 0               ');
              qryAux.SQL.Add('   AND HB.IDLOTE       = ' + IntToStr( iIdLote   )   );
              qryAux.SQL.Add('   AND HB.IDPESSOA     = ' + IntToStr( iIdPessoa )   );
              qryAux.SQL.Add('   AND HB.IDTITULAR    = ' + IntToStr( IDTitular )   );
              qryAux.SQL.Add('   AND HB.IDBENEFICIO  = ' + IntToStr( iIDBeneficio ) );
              qryAux.SQL.Add('   AND SUBSTR(HB.MESREFERENCIA,6,2) <> ''13'' ');
              qryAux.SQL.Add('   AND HB.MESREFERENCIA > CI.MESREFERENCIA ');
              qryAux.Open;

              If Not qryAux.isEmpty Then begin
                 Result := sErro +', no lote '+ qryAux.FieldByName('IDLOTE').AsString;
                 RollbackTransacao;
                 Exit;
              End;

              { excluindo a RUBRICASINDIV }
              sErro := 'Erro ao excluir as ribrucas individuais';

              qryAux.SQL.Clear;
              qryAux.SQL.Add(' DELETE FROM RUBRICAINDIV                    ');
              qryAux.SQL.Add(' WHERE IDMOVBENEF    = ' + IntToStr( iIdMovBenef ));
              qryAux.SQL.Add('   AND IDPESSOA      = ' + IntToStr( iIdPessoa ));
              qryAux.SQL.Add('   AND IDTITULAR     = ' + IntToStr( IDTitular ));
              Try
              qryAux.ExecSQL;
              //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
             Except
              on e:Exception do
              begin
                TratarErro(e.Message);
                Exit;
              end;
             end;
             //Brunno Mattos - KTN 767861 - SOL 132659 Fim

              { excluindo a HSTATRASOCONTRIB }
              sErro := 'Erro ao excluir o histórico de contribuição em atraso';
              qryAux.SQL.Clear;
              qryAux.SQL.Add(' DELETE FROM HSTATRASOCONTRIB                                                  ');
              qryAux.SQL.Add(' WHERE NUMRECEBIMENTO IN (SELECT NUMRECEBIMENTO                                ');
              qryAux.SQL.Add('                          FROM HSTCONTRIBPREV                                  ');
              qryAux.SQL.Add('                          WHERE IDCONTRIBUICAO IN (' + sContribSaldamento + ') ');
              qryAux.SQL.Add('                            AND IDMOVBENEF = ' + IntToStr( iIdMovBenef )  );
              qryAux.SQL.Add('                            AND IDPESSOA   = ' + IntToStr( iIdResponsavel ) );
              qryAux.SQL.Add('                            AND IDPESSJUR  = 91008                             )');
              qryAux.ExecSQL;

              { excluindo a HSTCONTRIBPREV }
              sErro := 'Erro ao excluir o histórico de contribuição';

              qryAux.SQL.Clear;
              qryAux.SQL.Add(' DELETE FROM HSTCONTRIBPREV                           ');
              qryAux.SQL.Add(' WHERE IDCONTRIBUICAO IN (' + sContribSaldamento + ') ');
              qryAux.SQL.Add('   AND IDMOVBENEF = ' + IntToStr( iIdMovBenef )  );
              qryAux.SQL.Add('   AND IDPESSOA   = ' + IntToStr( iIdResponsavel ) );
              qryAux.SQL.Add('   AND IDPESSJUR  = 91008                              ');
              qryAux.ExecSQL;

              { excluindo a HSTATRASOBENEF }
              sErro := 'Erro ao excluir o historico de benefício em atraso';

              qryAux.SQL.Clear;
              qryAux.SQL.Add(' DELETE FROM HSTATRASOBENEF                      ');
              qryAux.SQL.Add(' WHERE IDBENEFICIO =   ' + IntToStr( iIdBeneficio ) );
              qryAux.SQL.Add('   AND IDPESSOA    =   ' + IntToStr( iIdPessoa )    );
              qryAux.SQL.Add('   AND IDTITULAR   =   ' + IntToStr( IDTitular )    );

              qryAux.SQL.Add('   AND IDMOTIVO    =   ' + IntToStr( 3046 ) );

              qryAux.SQL.Add('   AND IDPLANOPREV =   ' + IntToStr(iIDPlanoPrev) );
              qryAux.ExecSQL;

              { excluindo a HSTBENEFBFCIARIO }
              sErro := 'Erro ao excluir o histórico de benefícios';

              qryAux.SQL.Clear;
              qryAux.SQL.Add(' DELETE FROM HSTBENEFBFCIARIO            ' );
              qryAux.SQL.Add(' WHERE IDMOVBENEF = ' + IntToStr(iIdMovBenef)   );
              qryAux.SQL.Add('   AND IDPESSOA   = ' + IntToStr(iIdPessoa) );
              qryAux.SQL.Add('   AND IDTITULAR  = ' + IntToStr(IDTitular));
              Try
              qryAux.ExecSQL;
              //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
             Except
              on e:Exception do
              begin
                TratarErro(e.Message);
                Exit;
              end;
             end;
             //Brunno Mattos - KTN 767861 - SOL 132659 Fim

              {----------------------------------------------------------------}
              { Ajustando o BENFBFCIARIO                                       }
              sErro := 'Erro no ajuste de benefícios antigos';

              If qryMOVBENEF.FieldByName('DATAFINAL').IsNull Then
                 sDataFinal := 'NULL'
              Else
                 sDataFinal := 'TO_DATE(' + QuotedStr( DateToStr(qryMOVBENEF.FieldByName('DATAFINAL').AsDateTime) ) +
                               ', ' + QuotedStr('DD/MM/YYYY') + ')';

              If qryMOVBENEF.FieldByName('DATAFINALANT').IsNull Then
                 sDataFinalAnt := 'NULL'
              Else
                 sDataFinalAnt := 'TO_DATE(' + QuotedStr( DateToStr(qryMOVBENEF.FieldByName('DATAFINALANT').AsDateTime) ) +
                                  ', ' + QuotedStr('DD/MM/YYYY') + ')';

              sErro := 'Erro no desfazer beneficio';
              If qryMOVBENEF.FieldByName('TIPOMOV').AsInteger = 4 Then Begin              { Encerramento }

                 { alterando o BENEFBFCIARIO Plano Antigo }
                 sErro := 'Erro ao atualizar benefícios antigos';

                 qryAux.SQL.Clear;
                 qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET DATAFINAL = ' + sDataFinal + ', ');
                 qryAux.SQL.Add('                          IDSITBENEFICIO = 1              ');
                 qryAux.SQL.Add(' WHERE IDPLANOPREV    = ' + IntToStr(iIDPlanAntigo)        );
                 qryAux.SQL.Add('   AND IDPESSOA       = ' + IntToStr(iIdPessoa)            );
                 qryAux.SQL.Add('   AND IDTITULAR      = ' + IntToStr(IDTitular)            );
                 qryAux.SQL.Add('   AND IDBENEFICIO    = ' + IntToStr(iIDBenefAntigo)       );
                 qryAux.SQL.Add('   AND NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso)      );
                 qryAux.SQL.Add('   AND IDPESSJUR      = 91008                             ');
                 qryAux.SQL.Add('   AND SEQPROPOSTA    = 1                                 ');
                 qryAux.ExecSQL;

                 { Atualizar PROCESSOBENEF }
                 qryAux.SQL.Clear;
                 qryAux.SQL.Add(' UPDATE PROCESSOBENEF SET                             ');
                 qryAux.SQL.Add('  IDSITPROCESSO = 1                                   ');
                 qryAux.SQL.Add(' WHERE NUMEROPROCESSO  = ' + IntToStr(iNumeroProcesso) );
                 qryAux.ExecSQL;


              End Else If qryMOVBENEF.FieldByName('TIPOMOV').AsInteger = 1 Then Begin     { Reativação }

                 qryAux.SQL.Clear;
                 qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET DATAFINAL = ' + sDataFinal + ', ');
                 qryAux.SQL.Add('                          IDSITBENEFICIO = 3              ');
                 qryAux.SQL.Add(' WHERE IDPLANOPREV    = ' + IntToStr(iIDPlanoPrev)         );
                 qryAux.SQL.Add('   AND IDPESSOA       = ' + IntToStr(iIdPessoa)            );
                 qryAux.SQL.Add('   AND IDTITULAR      = ' + IntToStr(IDTitular)            );
                 qryAux.SQL.Add('   AND IDBENEFICIO    = ' + IntToStr(iIDBenefAntigo)       );
                 qryAux.SQL.Add('   AND NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso)      );
                 qryAux.SQL.Add('   AND IDPESSJUR      = 91008                             ');
                 qryAux.SQL.Add('   AND SEQPROPOSTA    = 1                                 ');
                 qryAux.ExecSQL;

              End Else If qryMOVBENEF.FieldByName('TIPOMOV').AsInteger = 7 Then Begin     { Concessao }

                 sErro := 'Erro ao excluir benefícios de saldamento';

                 { excluindo a BENEFPLANOPART }
                 qryAux.SQL.Clear;
                 qryAux.SQL.Add(' DELETE FROM BENEFPLANOPART                          ');
                 qryAux.SQL.Add(' WHERE IDPLANOPREV    = ' + IntToStr(iIDPlanoPrev)    );
                 qryAux.SQL.Add('   AND IDPESSOA       = ' + IntToStr(iIdPessoa)       );
                 qryAux.SQL.Add('   AND IDBENEFICIO    = ' + IntToStr(iIDBenefAntigo)  );
                 qryAux.SQL.Add('   AND IDPESSJUR      = 91008                        ');
                 qryAux.SQL.Add('   AND SEQPROPOSTA    = 1                            ');
                 qryAux.ExecSQL;

                 { excluindo a BENEFBFCIARIO }
                 qryAux.SQL.Clear;
                 qryAux.SQL.Add(' DELETE FROM BENEFBFCIARIO                           ');
                 qryAux.SQL.Add(' WHERE IDPLANOPREV    = ' + IntToStr(iIDPlanoPrev)    );
                 qryAux.SQL.Add('   AND IDPESSOA       = ' + IntToStr(iIdPessoa)       );
                 qryAux.SQL.Add('   AND IDTITULAR      = ' + IntToStr(IDTitular)       );
                 qryAux.SQL.Add('   AND IDBENEFICIO    = ' + IntToStr(iIDBenefAntigo)  );
                 qryAux.SQL.Add('   AND NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso) );
                 qryAux.SQL.Add('   AND IDPESSJUR      = 91008                        ');
                 qryAux.SQL.Add('   AND SEQPROPOSTA    = 1                            ');
                 qryAux.ExecSQL;

                 { excluindo a BFCIARIOTITPLAN }
                 qryAux.SQL.Clear;
                 qryAux.SQL.Add(' DELETE FROM BFCIARIOTITPLAN                       ');
                 qryAux.SQL.Add(' WHERE IDPESSOA      = ' + IntToStr(iIdPessoa)      );
                 qryAux.SQL.Add('   AND IDTITULAR     = ' + IntToStr(IDTitular)      );
                 qryAux.SQL.Add('   AND IDPLANOPREV   = ' + IntToStr(iIDPlanoprev)   );
                 qryAux.SQL.Add('   AND IDBENEFICIO   = ' + IntToStr(iIDBenefAntigo) );
                 qryAux.SQL.Add('   AND IDPESSJUR   = 91008                         ');
                 qryAux.SQL.Add('   AND SEQPROPOSTA = 1                             ');
                 qryAux.ExecSQL;

                 { excluindo a PROCESSOBENEF }
                 If Not ( FazQuery( QryAux, 'SELECT 1 FROM BENEFBFCIARIO WHERE NUMEROPROCESSO = ' +
                                            IntToStr(iNumeroProcesso) ) )
                 Then Begin

                   qryAux.SQL.Clear;
                   qryAux.SQL.Add(' DELETE FROM PROCESSOBENEF                            ');
                   qryAux.SQL.Add(' WHERE NUMEROPROCESSO  = ' + IntToStr(iNumeroProcesso) );
                   qryAux.SQL.Add('   AND IDEVENTOGERADOR = 339                          ');
                   qryAux.ExecSQL;

                 End;

                 { excluindo a PREVIA }
                 qryAux.SQL.Clear;
                 qryAux.SQL.Add(' DELETE FROM PREVIA ');
                 qryAux.SQL.Add(' WHERE IDPESSOA    = ' + IntToStr( iIdPessoa ) );
                 qryAux.SQL.Add('   AND IDTITULAR   = ' + IntToStr(IDTitular)    );
                 qryAux.SQL.Add('   AND IDLOTE      = ' + IntToStr(iIDLote)      );
                 qryAux.ExecSQL;

                 { excluindo a TMPDESC }
                 qryAux.SQL.Clear;
                 qryAux.SQL.Add(' DELETE FROM TMPDESC                           ');
                 qryAux.SQL.Add(' WHERE IDPESSOA    = ' + IntToStr(iIdPessoa   ) );
                 qryAux.SQL.Add('   AND IDTITULAR   = ' + IntToStr(IDTitular)    );
                 qryAux.SQL.Add('   AND IDLOTE      = ' + IntToStr(iIDLote)      );
                 qryAux.SQL.Add('   AND IDDESCONTO IN (' + sContribSaldamento + ') ');
                 qryAux.ExecSQL;

              End;

              { excluindo a MOVBENEF }

              qryAux.SQL.Clear;
              qryAux.SQL.Add(' DELETE FROM MOVBENEF ');
              qryAux.SQL.Add(' WHERE IDPESSOA    = ' + IntToStr( iIdPessoa ) );
              qryAux.SQL.Add('   AND IDTITULAR   = ' + IntToStr( IDTitular ) );
              qryAux.SQL.Add('   AND IDMOVBENEF  = ' + IntToStr( iIdMovBenef ) );
              qryAux.ExecSQL;

              qryMOVBENEF.Next;

            End; { While Not qryMOVBENEF.EOF do Begin }

            { excluindo a PARAMETROS DA PESSOA  }
            sErro := 'Erro ao excluir os parametros pessoais ';

            qryAux.SQL.Clear;
            qryAux.SQL.Add(' DELETE FROM PESSOAPARAM             ');
            qryAux.SQL.Add(' WHERE IDPESSOA  = ' + IntToStr( iIdPessoa ) );
            qryAux.SQL.Add('   AND IDPARAM   = 75' );
            qryAux.ExecSQL;

            { Excluindo outras RUBRICASINDIV ( Peculio )}
            sErro := 'Erro ao excluir as ribrucas individuais';

            qryAux.SQL.Clear;
            qryAux.SQL.Add(' DELETE FROM RUBRICAINDIV                    ');
            qryAux.SQL.Add(' WHERE IDPESSOA      = ' + IntToStr( iIdPessoa ));
            qryAux.SQL.Add('   AND IDTITULAR     = ' + IntToStr( IDTitular ));
            qryAux.SQL.Add('   AND IDRUBRICA IN ( 38599, 38645, 38779, 38788, 38797 ,38805 ) ');
            Try
            qryAux.ExecSQL;
            //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
             Except
              on e:Exception do
              begin
                TratarErro(e.Message);
                Exit;
              end;
             end;
             //Brunno Mattos - KTN 767861 - SOL 132659 Fim

            {--------------------------}
            { Voltando ao plano antigo }
            {--------------------------}

            { Atualizando TMPDESC }
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' UPDATE TMPDESC SET                       ');
            qryAux.SQL.Add('    IDPLANOPREV =    ' + IntToStr( iIDPlanAntigo ) );
            qryAux.SQL.Add(' WHERE IDPESSOA     = ' + IntToStr( iIdPessoa ) );
            qryAux.SQL.Add('   AND IDTITULAR    = ' + IntToStr( IDTitular ) );
            qryAux.SQL.Add('   AND SITENVIO     = ''0'''  );
            qryAux.SQL.Add('   AND FLGDESCFOLHA = ''B'' ');
            qryAux.ExecSQL;

            { Atualizando CONTRATOEMPTMO }
            If (iIDPlanAntigo <> iIDPlanoPrev) Then Begin

              qryAux.SQL.Clear;
              qryAux.SQL.Add(' UPDATE CONTRATOEMPTMO SET IDPLANOPREV = '+ IntToStr( iIdPlanAntigo )  +
                             ' WHERE  IDPATRO     = '+ IntToStr( 91008 )  +
                             ' AND    IDPLANOPREV = '+ IntToStr( iIDPlanoPrev ) +
                             ' AND    IDBENEF     = '+ IntToStr( iIdPessoa ) ) ;
              qryAux.ExecSQL;

            End;

            qryBeneficiarios.Next;

          End; { While ( Not qryBeneficio.Eof ) Then Begin }



          { Pensionista }

          If ( flgInterno = 'CA' ) Then Begin
            // inicio - Fernando Santana - Kintana 929902 sol 143267
            if iIdNucleoFamiliar = 0 then
            begin
              qryAux.close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add('select IDNUCLEOFAMILIAR');
              qryAux.SQL.Add('from   nucleofamiliar');
              qryAux.SQL.Add('where  idrespnucleo = '+ inttostr(iIdResponsavel));
              qryAux.SQL.Add('and    idtitular    = '+ inttostr(IDtitular));
              qryAux.open;

              iIdNucleoFamiliar := qryAux.fieldbyname('IDNUCLEOFAMILIAR').value;
            end;

            // Fim - // Fernando Santana - Kintana 929902 sol 143267

            qryAux.SQL.Clear;
            qryAux.SQL.Add(' DELETE  CONTRIBPREVNUCLEO  ');
            qryAux.SQL.Add(' WHERE IDNUCLEOFAMILIAR = ' + IntToStr( iIdNucleoFamiliar ) );
            qryAux.SQL.Add('   AND IDCONTRIBUICAO in (633,697) ');
            qryAux.ExecSQL;

            qryAux.SQL.Clear;
            qryAux.SQL.Add(' UPDATE CONTRIBPREVNUCLEO SET ');
            qryAux.SQL.Add('   FLGCOBRA  = 1,         ' );
            qryAux.SQL.Add('   DATAFINAL = NULL       ' );
            qryAux.SQL.Add(' WHERE IDNUCLEOFAMILIAR = ' + IntToStr( iIdNucleoFamiliar ) );
            qryAux.ExecSQL;

          End;

          { Alterando a ELEGPATRO }
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' UPDATE ELEGPATRO SET IDSITFUNC = ' + IntToStr( iIDSitFunc ) );
          qryAux.SQL.Add(' WHERE IDPESSOA       = '           + IntToStr( IDTitular )  );
          qryAux.SQL.Add('   AND IDPESSJUR      = 91008                             ');
          qryAux.ExecSQL;

          { Alterando a PARTPREVPLAN  }
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET IDSITPART      = ' + IntToStr( iIDSitPart ) + ', ');
          qryAux.SQL.Add('                         IDSITPLANOPREV = ' + IntToStr( iIDSitPlan ) + '  ');

          If (iIDPlanAntigo <> iIDPlanoPrev) Then Begin
            qryAux.SQL.Add(' , FLGDESATIVADO    = 1, ');
            qryAux.SQL.Add('   DATACANCELAMENTO = TO_DATE('+ QuotedStr( sDataCancelamento )+',''DD/MM/YYYY'')' );
          End;

          qryAux.SQL.Add(' WHERE  IDPESSOA       = '                  + IntToStr( IDTitular )        );
          qryAux.SQL.Add('   AND  IDPESSJUR      = 91008                                          ');
          qryAux.SQL.Add('   AND  IDPLANOPREV    = '                  + IntToStr( iIDPlanoPrev )     );
          qryAux.ExecSQL;

          { Verificar se participante nao era migrado no caso de pensão, se não }
          { fazer tratamento especial                                           }

          If ( flgInterno = 'CA' ) Then Begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' SELECT 1 FROM PARTPREVPLAN ');
            qryAux.SQL.Add(' WHERE  IDPESSOA       = ' + IntToStr( IDTitular )  );
            qryAux.SQL.Add('   AND  IDPESSJUR      = 91008                     ');
            qryAux.SQL.Add('   AND  IDPLANOPREV   <> ' + IntToStr( iIDPlanoPrev ) );
            qryAux.Open;

            If ( QryAux.IsEmpty ) Then Begin

              iIDPlanAntigo := iIDPlanoPrev;
              iIDPlanoPrev  := -1;

            End;

          End;

          If (iIDPlanAntigo <> iIDPlanoPrev) Then Begin { REB }

             qryAux.SQL.Clear;
             qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET IDSITPART        = ' + IntToStr(iIDSitPart) + ', ');
             qryAux.SQL.Add('                         IDSITPLANOPREV   = ' + IntToStr(iIDSitPlan) + ', ');
             qryAux.SQL.Add('                         FLGDESATIVADO    = 0,                            ');
             qryAux.SQL.Add('                         DATACANCELAMENTO = NULL                          ');
             qryAux.SQL.Add(' WHERE  IDPESSOA       = '                  + IntToStr(IDTitular)    );
             qryAux.SQL.Add('   AND  IDPESSJUR      = 91008                                      ');
             qryAux.SQL.Add('   AND  IDPLANOPREV    = '                  + IntToStr(iIDPlanAntigo));
             qryAux.ExecSQL;
             
          end;

          //RollbackTransacao;
          CommitTransacao;

          sErro  := '';
          Result := sErro;

        end else begin

           RollbackTransacao;
           Result := sErro;

        End;   { Fim - If (Not qryBeneficio.IsEmpty) }

      end else begin

        RollbackTransacao;
        Result := sErro;
      end  { Fim - If (Not qryEVENTOSPREV.IsEmpty) }
   except
      RollbackTransacao;
      Result := sErro;
   end;

   FreeAndNil(qryAux);
end;



end.