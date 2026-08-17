unit FApagaPreviaMigraPlano;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, ComCtrls;


type
   TfrmApagaPreviaMigraPlano = class(TfrmOkCancelar)
    pgctrlExcluir: TPageControl;
    tbsIndividual: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    edtMatricula: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dtInicioPeriodo: TCMDateTimePicker;
    dtFimPeriodo: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    dtInscricao: TCMDateTimePicker;
    rgrpTipo: TRadioGroup;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);

   private { Private declarations }

   public { Public declarations }

   end;



var
  frmApagaPreviaMigraPlano: TfrmApagaPreviaMigraPlano;



implementation
{$R *.DFM}
uses
   uMensErro, dBaseDados, uDataBase, UModulo, USimuladorBrTPREV;



procedure TfrmApagaPreviaMigraPlano.bbtnConfirmarClick(Sender: TObject);
var
   sMatricula  : String;
   qryBusca    : TwwQuery;
   qryApaga    : TwwQuery;

   iPessoa     : Integer;
   iPatro      : Integer;
begin
   inherited;

   qryBusca := TwwQuery.Create(Application);
   qryApaga := TwwQuery.Create(Application);

   qryBusca.DatabaseName := 'BASEDADOS';
   qryApaga.DatabaseName := 'BASEDADOS';

   try
//      StartTransacao;

      // -------------------------------------------------------------------------------------------

      sMatricula := QuotedStr(trim(edtMatricula.Text));

      qryBusca.SQL.Text :=
      'SELECT '                           + #13 +
      '   EL.IDPESSOA, EL.IDPESSJUR '     + #13 +
      'FROM '                             + #13 +
      '   ELEGPATRO EL '                  + #13 +
      'WHERE '                            + #13 +
      '   EL.MATRICULA = ' + sMatricula;

      try
         qryBusca.Open;

         if qryBusca.IsEmpty then begin
            MsgDlg('A Matrícula digitada não foi localizada!', 'Simulador', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end else begin
            iPessoa  := qryBusca.FieldByName('IDPESSOA').AsInteger;
            iPatro   := qryBusca.FieldByName('IDPESSJUR').AsInteger;
         end;

      except
         MsgDlg('Ocorreu ERRO na busca da Matrícula digitada!', 'Simulador', mtERROR, [mbOk], 0);
         Repaint;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      if MsgDlg('Deseja realmente excluir a Prévia de Migração ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      qryBusca.SQL.Text :=
      'SELECT '                                    + #13 +
      '   NVL(FLGEFETIVADO, 0) AS FLGEFETIVADO '   + #13 +
      'FROM '                                      + #13 +
      '   PREVIAMIGRAPLANO '                       + #13 +
      'WHERE '                                     + #13 +
      '       IDPESSOA  = ' + IntToStr(iPessoa)    + #13 +
      '   AND IDPESSJUR = ' + IntToStr(iPatro);

      qryBusca.Open;
      if qryBusca.FieldByName('FLGEFETIVADO').AsInteger <> 0 then begin
         MsgDlg('A Migração da Matrícula digitada já foi efetivada, logo sua Prévia não pode ser excluída!', 'Simulador', mtWarning, [mbOk], 0);
         Repaint;

         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      dtmBaseDados.dbBaseDados.StartTransaction;
      Modulo.GravaLogTOTALPREV ('Exclusão de Prévia de Migração - Matrícula '+sMatricula);
      qryApaga.SQL.Text :=
      'DELETE FROM '                            + #13 +
      '   PREVIAMIGRAPLANO '                    + #13 +
      'WHERE '                                  + #13 +
      '       IDPESSOA  = ' + IntToStr(iPessoa) + #13 +
      '   AND IDPESSJUR = ' + IntToStr(iPatro);

      try
         qryApaga.ExecSQL;

         if qryApaga.RowsAffected <= 0 then begin
            MsgDlg('Não foram encontrados registros a excluir.', 'Simulador', mtInformation, [mbOk], 0);
            Repaint;
         end else begin
            MsgDlg('Prévia de Migração excluída.', 'Simulador', mtInformation, [mbOk], 0);
            Repaint;
         end;

      except
         MsgDlg('Houve ERRO na tentativa de excluir a Prévia de Migração!', 'Simulador', mtError, [mbOk], 0);
         Repaint;
         dtmBaseDados.dbBaseDados.Rollback;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

   finally
      dtmBaseDados.dbBaseDados.Commit;
      qryBusca.Close;
      qryBusca.Free;
      qryApaga.Free;
   end;
end;



procedure TfrmApagaPreviaMigraPlano.bbtnCancelarClick(Sender: TObject);
var
   sMatricula  : String;
   qryBusca    : TwwQuery;
   qryApaga    : TwwQuery;
   qryAux      : TwwQuery;

   iPessoa     : Integer;
   iPatro      : Integer;
   sIdEventoGerador : string;
begin
   inherited;

   qryBusca := TwwQuery.Create(Application);
   qryApaga := TwwQuery.Create(Application);
   qryAux   := TwwQuery.Create(Application);

   qryBusca.DatabaseName := 'BASEDADOS';
   qryApaga.DatabaseName := 'BASEDADOS';
   qryAux.DatabaseName   := 'BASEDADOS';

   try
      dtmBaseDados.dbBaseDados.StartTransaction;
      // -------------------------------------------------------------------------------------------
      sMatricula := QuotedStr(trim(edtMatricula.Text));

      if pgctrlExcluir.ActivePage = tbsIndividual
      then begin
         qryBusca.SQL.Text :=   ' SELECT  EL.IDPESSOA, EL.IDPESSJUR   '+
                                  ' FROM    ELEGPATRO EL              '+
                                  ' WHERE   EL.MATRICULA = '+ sMatricula;
         Modulo.GravaLogTOTALPREV ('Exclusão de Efetivação de Migração - Individual - Matrícula : '+sMatricula);
      end
      else begin
           qryBusca.SQL.Text :=   ' SELECT  EL.IDPESSOA, EL.IDPESSJUR      '+
                                  ' FROM    PESSOAFISICA PF, ELEGPATRO EL, '+
                                  '         PARTPREVPLAN PP, SITPART SP    '+
                                  ' WHERE   PP.IDPLANOPREV = 33            '+
                                  ' AND     EL.IDPESSJUR   = PP.IDPESSJUR  '+
                                  ' AND     EL.IDPESSOA    = PP.IDPESSOA   '+
                                  ' AND     PF.IDPESSOA    = EL.IDPESSOA   '+
                                  ' AND     SP.IDSITPART   = PP.IDSITPART  '+
                                  ' AND     TO_CHAR(PP.INSCRICAODATA,''DD/MM/YYYY'')   = '''+dtInscricao.Text+''''+
                                  ' AND     TO_CHAR(PP.TRGDTINCLUSAO, ''YYYY/MM/DD'')  >= '''+Copy(dtInicioPeriodo.Text,7,4)+'/'+Copy(dtInicioPeriodo.Text,4,2)+'/'+Copy(dtInicioPeriodo.Text,1,2)+'''';

           if Trim(dtFimPeriodo.Text) <> ''
           then qryBusca.SQL.Add(' AND     TO_CHAR(PP.TRGDTINCLUSAO, ''YYYY/MM/DD'')   <= '''+Copy(dtFimPeriodo.Text,7,4)+'/'+Copy(dtFimPeriodo.Text,4,2)+'/'+Copy(dtFimPeriodo.Text,1,2)+'''');

           case rgrpTipo.ItemIndex of
                0 :  begin
                        qryBusca.SQL.Add('AND PP.IDPESSOA IN (SELECT DISTINCT IDPESSOA FROM PREVIAMIGRAPLANO WHERE CODCAMPOMIGRA = ''SITUACAO'' AND VALORAMIGRAR = ''AT'')  ');
                        Modulo.GravaLogTOTALPREV ('Exclusão de Efetivação de Migração - Em Lote - Período : '+dtInicioPeriodo.Text+' a '+dtFimPeriodo.Text+' - Início : '+dtInscricao.Text +' - Ativos ');
                     end;
                1 :  begin
                        qryBusca.SQL.Add('AND PP.IDPESSOA IN (SELECT DISTINCT IDPESSOA FROM PREVIAMIGRAPLANO WHERE CODCAMPOMIGRA = ''SITUACAO'' AND VALORAMIGRAR = ''MA'')  ');
                        Modulo.GravaLogTOTALPREV ('Exclusão de Efetivação de Migração - Em Lote - Período : '+dtInicioPeriodo.Text+' a '+dtFimPeriodo.Text+' - Início : '+dtInscricao.Text +' - Autopat. ');
                     end;
                2 :  begin
                        qryBusca.SQL.Add('AND PP.IDPESSOA IN (SELECT DISTINCT IDPESSOA FROM PREVIAMIGRAPLANO WHERE CODCAMPOMIGRA = ''SITUACAO'' AND VALORAMIGRAR = ''AS'')  ');
                        Modulo.GravaLogTOTALPREV ('Exclusão de Efetivação de Migração - Em Lote - Período : '+dtInicioPeriodo.Text+' a '+dtFimPeriodo.Text+' - Início : '+dtInscricao.Text +' - Assistidos ');
                     end;
                3 :  begin
                        qryBusca.SQL.Add('AND PP.IDPESSOA IN (SELECT DISTINCT IDPESSOA FROM PREVIAMIGRAPLANO WHERE CODCAMPOMIGRA = ''SITUACAO'' AND VALORAMIGRAR = ''FL'')  ');
                        Modulo.GravaLogTOTALPREV ('Exclusão de Efetivação de Migração - Em Lote - Período : '+dtInicioPeriodo.Text+' a '+dtFimPeriodo.Text+' - Início : '+dtInscricao.Text +' - Pensionistas ');
                     end;
           end;
      end;

      try
         qryBusca.Open;
         if qryBusca.IsEmpty
         then begin
            MsgDlg('Nenhum participante encontrado nas condições indicadas. ', 'Simulador', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end ;
      except
         MsgDlg('Ocorreu ERRO na busca dos participantes.', 'Simulador', mtERROR, [mbOk], 0);
         Repaint;
         Exit;
      end;

      qryBusca.First;
      while not qryBusca.Eof do
      begin
         iPessoa  := qryBusca.FieldByName('IDPESSOA').AsInteger;
         iPatro   := qryBusca.FieldByName('IDPESSJUR').AsInteger;

         if iPatro = 50028
         then sIdEventoGerador := '60'
         else sIdEventoGerador := '45';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT DISTINCT INSCRICAODATA AS DATAINICIO FROM PARTPREVPLAN '+
                        ' WHERE  IDPLANOPREV = 33                                       '+
                        ' AND    IDPESSOA    = '+ IntToStr(iPessoa));
         qryAux.Open;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = 1, DATAFINAL = NULL '+
                          ' WHERE  IDPLANOPREV    <> 33 '+
                          ' AND    IDTITULAR      =    '+ IntToStr(iPessoa)+
                          ' AND    DATAFINAL      = TO_DATE('''+DateToStr(StrToDate(qryAux.FieldByName('DATAINICIO').AsString)-1)+''',''dd/mm/yyyy'')');
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT DISTINCT NUMEROPROCESSO, DATAINICIO FROM BENEFBFCIARIO '+
                        ' WHERE  IDPLANOPREV = 33                  '+
                        ' AND    IDTITULAR   =                     '+ IntToStr(iPessoa));
         qryAux.Open;

         if not qryAux.IsEmpty
         then begin
            qryApaga.Close;
            qryApaga.SQL.Clear;
            qryApaga.SQL.Add(' DELETE HSTBENEFBFCIARIO '+
                             ' WHERE  NUMEROPROCESSO = '+qryAux.FieldByName('NUMEROPROCESSO').AsString+
                             ' AND    IDPLANOPREV    = 33 '+
                             ' AND    IDTITULAR      =    '+ IntToStr(iPessoa));
            try
               qryApaga.ExecSQL;
            except
               MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
               Repaint;
               dtmBaseDados.dbBaseDados.Rollback;
               Exit;
            end;

            qryApaga.Close;
            qryApaga.SQL.Clear;
            qryApaga.SQL.Add(' DELETE BENEFBFCIARIO '+
                             ' WHERE  NUMEROPROCESSO = '+qryAux.FieldByName('NUMEROPROCESSO').AsString+
                             ' AND    IDPLANOPREV    = 33 '+
                             ' AND    IDTITULAR      =    '+ IntToStr(iPessoa));
            try
               qryApaga.ExecSQL;
            except
               MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
               Repaint;
               dtmBaseDados.dbBaseDados.Rollback;
               Exit;
            end;

            qryApaga.Close;
            qryApaga.SQL.Clear;
            qryApaga.SQL.Add(' DELETE PROCESSOBENEF '+
                             ' WHERE  NUMEROPROCESSO = '+qryAux.FieldByName('NUMEROPROCESSO').AsString);
            try
               qryApaga.ExecSQL;
            except
               MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
               Repaint;
               dtmBaseDados.dbBaseDados.Rollback;
               Exit;
            end;

            qryApaga.Close;
            qryApaga.SQL.Clear;
            qryApaga.SQL.Add(' DELETE PREVIA '+
                             ' WHERE  NUMEROPROCESSO = '+qryAux.FieldByName('NUMEROPROCESSO').AsString+
                             ' AND    IDPLANOPREV    = 33 '+
                             ' AND    IDPESSOA       =    '+ IntToStr(iPessoa));
            try
               qryApaga.ExecSQL;
            except
               MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
               Repaint;
               dtmBaseDados.dbBaseDados.Rollback;
               Exit;
            end;

         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' DELETE HISTMOVRESERVA '+
                          ' WHERE  IDPLANOPREV    = 33 '+
                          ' AND    IDPESSOA       =    '+ IntToStr(iPessoa));
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' DELETE RESERVAPART '+
                          ' WHERE  IDPLANOPREV    = 33 '+
                          ' AND    IDPESSOA       =    '+ IntToStr(iPessoa));
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' DELETE HSTCONTEVENTOSPR    '+
                          ' WHERE  IDEVENTOSPREV IN (SELECT IDEVENTOSPREV '+
                          '                          FROM   EVENTOSPREV   '+
                          '                          WHERE  IDPLANOPREV    = 33 '+
                          '                          AND    IDPESSOA       =    '+ IntToStr(iPessoa)+' ) ');
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' DELETE EVENTOSPREV '+
                          ' WHERE  IDPLANOPREV    = 33 '+
                          ' AND    IDPESSOA       =    '+ IntToStr(iPessoa));
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' DELETE HSTCONTRIBPREV      '+
                          ' WHERE  IDPLANOPREV    = 33 '+
                          ' AND    IDPESSOA       =    '+ IntToStr(iPessoa));
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' DELETE CONTRIBPREVPARTP    '+
                          ' WHERE  IDPLANOPREV    = 33 '+
                          ' AND    IDPESSOA       =    '+ IntToStr(iPessoa));
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' DELETE EVENTOSPREV '+
                          ' WHERE  IDEVENTOGERADOR = '+OraNumero(sIdEventoGerador)+
                          ' AND    IDPESSOA        = '+ IntToStr(iPessoa));
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' DELETE BFCIARIOTITPLAN '+
                          ' WHERE  IDPLANOPREV    = 33 '+
                          ' AND    IDTITULAR      =    '+ IntToStr(iPessoa));
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' DELETE PARTPREVPLAN '+
                          ' WHERE  IDPLANOPREV    = 33 '+
                          ' AND    IDPESSOA       =    '+ IntToStr(iPessoa));
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' UPDATE PARTPREVPLAN SET FLGDESATIVADO = 0 '+
                          ' WHERE  IDPLANOPREV    <> 33 '+
                          ' AND    IDPESSOA       =    '+ IntToStr(iPessoa));
         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT IDPLANOPREV FROM PARTPREVPLAN '+
                        ' WHERE  FLGDESATIVADO = 0             '+
                        ' AND    IDPESSOA      = '+IntToStr(iPessoa));
         qryAux.Open;

         if not qryAux.IsEmpty
         then begin
            qryApaga.Close;
            qryApaga.SQL.Clear;
            qryApaga.SQL.Add(' UPDATE CONTRATOEMPTMO SET IDPLANOPREV = '+qryAux.FieldbyName('IDPLANOPREV').AsString+
                             ' WHERE  IDPLANOPREV = 33 '+
                             ' AND    IDPESSOA    = '+IntToStr(iPessoa));
            try
               qryApaga.ExecSQL;
            except
               MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
               Repaint;
               dtmBaseDados.dbBaseDados.Rollback;
               Exit;
            end;

            qryApaga.Close;
            qryApaga.SQL.Clear;
            qryApaga.SQL.Add(' UPDATE TMPDESC SET IDPLANOPREV = '+qryAux.FieldbyName('IDPLANOPREV').AsString           +
                             ' WHERE  IDPESSOA    =     '+IntToStr(iPessoa)                                            +
                             ' AND    IDPLANOPREV =  33 '                                                              +
                             ' AND    SITENVIO    < 9                                                                 ');
            try
               qryApaga.ExecSQL;
            except
               MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
               Repaint;
               dtmBaseDados.dbBaseDados.Rollback;
               Exit;
            end;
         end;

         qryApaga.Close;
         qryApaga.SQL.Clear;
         qryApaga.SQL.Add(' UPDATE PREVIAMIGRAPLANO SET FLGEFETIVADO = 0 '+
                          ' WHERE  IDPESSOA  =    '+ IntToStr(iPessoa) );

         try
            qryApaga.ExecSQL;
         except
            MsgDlg('Erro ao desfazer efetivação.','Erro', mtError,[mbOk],0);
            Repaint;
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end;

         qryBusca.Next;
      end;
   finally
      if MsgDlg('Deseja realmente excluir a Efetivação de Migração ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
      then dtmBaseDados.dbBaseDados.Rollback
      else dtmBaseDados.dbBaseDados.Commit;
      qryBusca.Close;
      qryBusca.Free;
      qryApaga.Free;
      qryAux.Free;
   end;
end;

end.
