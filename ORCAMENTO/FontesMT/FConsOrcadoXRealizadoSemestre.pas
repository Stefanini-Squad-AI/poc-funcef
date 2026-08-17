unit FConsOrcadoXRealizadoSemestre;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, AxCtrls, OleCtrls, vcf1, ComCtrls,
   uCmSqlParams, Db, DBTables, Wwquery, wwdblook, Mask, wwdbedit, Wwdbspin,
  DBClient, uCMClientDataSet, mPlanoOrcamentarioMT;

type
   TfrmConsOrcadoXRealizadoSemestre = class(TfrmOkCancelar)
    pgc: TPageControl;
    tbsFiltro: TTabSheet;
    tbsResult: TTabSheet;
      Planilha: TF1Book;
      qryConta: TwwQuery;
      qryGrupo: TwwQuery;
      qrySaldo: TwwQuery;
      qryGrupoIDGRUPOORCAMEN: TFloatField;
      qryGrupoNOMEGRUPOORCAMEN: TStringField;
      qryGrupoCODGRUPOORC: TStringField;
      qryContaIDCONTAORCAMEN: TStringField;
      qryContaNOMECONTAORCAMEN: TStringField;
      qrySaldoVLRREALIZADO: TFloatField;
      qrySaldoVLRORCADO: TFloatField;
      lblExercicio: TLabel;
      DBspnExercicio: TwwDBSpinEdit;
      Label2: TLabel;
      sqlPlano: TCMSqlParams;
      sqlGrupo: TCMSqlParams;
      cdsPlano: TCMClientDataSet;
      cdsGrupo: TCMClientDataSet;
    Temporizador: TTimer;
    btnLimpaCli: TBitBtn;
    molPlano: TmolPlanoOrcamentario;
    DBcboGrupoOrcamen: TwwDBLookupCombo;
    qryContaNOME: TStringField;
    gbParametros: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    sePosIni1: TwwDBSpinEdit;
    sePosFim1: TwwDBSpinEdit;
    edConteudo1: TEdit;
    sePosIni2: TwwDBSpinEdit;
    sePosFim2: TwwDBSpinEdit;
    edConteudo2: TEdit;
    sePosIni3: TwwDBSpinEdit;
    sePosFim3: TwwDBSpinEdit;
    edConteudo3: TEdit;
    sePosIni4: TwwDBSpinEdit;
    sePosFim4: TwwDBSpinEdit;
    edConteudo4: TEdit;

      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
    procedure btnLimpaCliClick(Sender: TObject);
    procedure molPlanocboPlanoOrcamenCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);


   private  // Private declarations

      function  VerificaPreenchimento: Boolean;


   public   // Public declarations

   end;



var
   frmConsOrcadoXRealizadoSemestre: TfrmConsOrcadoXRealizadoSemestre;



implementation
{$R *.DFM}
uses
   uMensErro, uSistema, uModulo, uFuncoesOrcamento, uDiasUteis, uVerificaPreenchimento,
  FProgressoDuplo;



function  TfrmConsOrcadoXRealizadoSemestre.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try
      if molPlano.cboPlanoOrcamen.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Plano Orçamentário!', molPlano.cboPlanoOrcamen);

   except

      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmConsOrcadoXRealizadoSemestre.bbtnConfirmarClick(Sender: TObject);
var
   iLinha         : Integer;
   iColuna        : Integer;

   iQuantGrupo    : Integer;
   iQuantConta    : Integer;
   iPosGrupo      : Integer;
   iPosConta      : Integer;

   iExercicio     : Integer;
   iPeriodo       : Integer;

   fVlrOrcSem1    : Currency;
   fVlrRealSem1   : Currency;

   fVlrOrcSem2    : Currency;
   fVlrRealSem2   : Currency;
   sSQL           : String;
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   try
      Planilha.ClearRange(4, 1, 4096, 128, F1ClearValues);

      with qryGrupo do
      begin
         LimpaParametros(qryGrupo);
         if DBcboGrupoOrcamen.LookupValue <> '' then ParamByName('PIDGRUPOORCAMEN').AsInteger := strToInt(DBcboGrupoOrcamen.LookupValue);
         Open;

         iQuantGrupo := qryGrupo.RecordCount;
      end;

      qryGrupo.First;
      iPosGrupo   := 0;
      iLinha      := 3;

      frmProgressoDuplo.MostraFormProgressoDuplo('Grupos',
                                                 'Contas Orçamentárias',
                                                 0,
                                                 0,
                                                 iQuantGrupo,
                                                 -1,
                                                 True,
                                                 True
                                                );

      while not(qryGrupo.EOF) do
      begin

         if frmProgressoDuplo.Cancelou then
         begin
            MsgDlg('Processo cancelado pelo Usuário.', 'Orçamento', mtInformation, [mbOk], 0);
            Repaint;

            Exit;
         end;

         frmProgressoDuplo.AndaFormProgressoDuplo(iPosGrupo, -1);

         with qryConta do
         begin

            sSQL :=
            'SELECT '                                           + #13 +
            '   CO.IDCONTAORCAMEN, '                            + #13 +
            '   CO.NOMECONTAORCAMEN, '                          + #13 +
            '   CR.NOME '                                       + #13 +
            'FROM '                                             + #13 +
            '   CONTASORCAMEN CO, '                             + #13 +
            '   CENTRESPON    CR '                              + #13 +
            'WHERE '                                            + #13 +
            '       CO.IDPLANOORCAMEN  =:PIDPLANOORCAMEN '      + #13 +
            '   AND CO.IDGRUPOORCAMEN  =:PIDGRUPOORCAMEN '      + #13 +
            '   AND CR.CODCENTRORESPON = CO.CODCENTRORESPON '   + #13;

            if sePosIni1.Value > 0  then begin
               sSQL := sSQL +
               ' AND (SUBSTR(CO.IDCONTAORCAMEN,' + sePosIni1.Text + ',' + sePosFim1.Text +
                           ') IN (' + Trim(edConteudo1.Text) + '))' + #13;
            end;

            if sePosIni2.Value > 0 then begin
               sSQL := sSQL +
               ' AND (SUBSTR(CO.IDCONTAORCAMEN,' + sePosIni2.Text + ',' + sePosFim2.Text +
                           ') IN (' + Trim(edConteudo2.Text) + '))' + #13;
            end;

            if sePosIni3.Value > 0 then begin
               sSQL := sSQL +
               ' AND (SUBSTR(CO.IDCONTAORCAMEN,' + sePosIni3.Text + ',' + sePosFim3.Text +
                           ') IN (' + Trim(edConteudo3.Text) + '))' + #13;
            end;

            if sePosIni4.Value > 0 then begin
               sSQL := sSQL +
              ' AND (SUBSTR(CO.IDCONTAORCAMEN,' + sePosIni4.Text + ',' + sePosFim4.Text +
                           ') IN (' + Trim(edConteudo4.Text) + '))' + #13;
            end;

            sSQL := sSQL +
            'ORDER BY  '                  + #13 +
            '   CO.NOMECONTAORCAMEN '     + #13;

            Sql.Text := sSQL;

            ParamByName('PIDPLANOORCAMEN').AsInteger := strToInt(molPlano.cboPlanoOrcamen.LookupValue);
            ParamByName('PIDGRUPOORCAMEN').AsInteger := qryGrupoIDGRUPOORCAMEN.AsInteger;

            Open;

            iQuantConta := qryConta.RecordCount;
         end;

         qryConta.First;
         iPosConta := 0;

         if not(qryConta.IsEmpty) then
         begin
            inc(iPosGrupo);
            inc(iLinha);

            Planilha.TextRC[iLinha, 1] := qryGrupoCODGRUPOORC.AsString;
            Planilha.TextRC[iLinha, 3] := qryGrupoNOMEGRUPOORCAMEN.AsString;

            frmProgressoDuplo.MostraFormProgressoDuplo('Grupos',
                                                       'Contas Orçamentárias',
                                                       0,
                                                       0,
                                                       iQuantGrupo,
                                                       iQuantConta,
                                                       True,
                                                       True
                                                      );
         end;

         while not(qryConta.EOF) do
         begin
            inc(iPosConta);
            inc(iLinha);

            Planilha.TextRC[iLinha, 2] := qryContaNOME.AsString;
            Planilha.TextRC[iLinha, 3] := qryContaIDCONTAORCAMEN.AsString;
            Planilha.TextRC[iLinha, 4] := qryContaNOMECONTAORCAMEN.AsString;

            if frmProgressoDuplo.Cancelou then
            begin
               MsgDlg('Processo cancelado pelo Usuário.', 'Orçamento', mtInformation, [mbOk], 0);
               Repaint;

               Exit;
            end;

            frmProgressoDuplo.AndaFormProgressoDuplo(iPosGrupo, iPosConta);

            fVlrOrcSem1    := 0;
            fVlrRealSem1   := 0;

            fVlrOrcSem2    := 0;
            fVlrRealSem2   := 0;

            for iPeriodo := 1 to 12 do
            begin
               with qrySaldo do
               begin
                  LimpaParametros(qrySaldo);
                  ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
                  ParamByName('PIDPLANOORCAMEN').AsInteger  := StrToInt(molPlano.cboPlanoOrcamen.LookupValue);
                  ParamByName('PIDCONTAORCAMEN').AsString   := qryContaIDCONTAORCAMEN.AsString;
                  ParamByName('PEXERCICIO').AsInteger       := trunc(DBspnExercicio.Value);
                  ParamByName('PPERIODO').AsInteger         := iPeriodo;

                  Open;
               end;

               if iPeriodo < 7 then
               begin
                  iColuna        := iPeriodo + 6;
                  fVlrOrcSem1    := fVlrOrcSem1 + qrySaldoVLRORCADO.AsCurrency;
                  fVlrRealSem1   := fVlrRealSem1 + qrySaldoVLRREALIZADO.AsCurrency;

                  Planilha.NumberRC[iLinha, iColuna] := qrySaldoVLRREALIZADO.AsCurrency;
               end
               else
               begin
                  iColuna        := iPeriodo + 13;
                  fVlrOrcSem2    := fVlrOrcSem2 + qrySaldoVLRORCADO.AsCurrency;
                  fVlrRealSem2   := fVlrRealSem2 + qrySaldoVLRREALIZADO.AsCurrency;

                  Planilha.NumberRC[iLinha, iColuna] := qrySaldoVLRREALIZADO.AsCurrency;
               end;

               // ----------------------------------------------------------------------------------

               Planilha.NumberRC[iLinha,  6]    := fVlrOrcSem1;
               Planilha.NumberRC[iLinha, 14]    := fVlrRealSem1;
               Planilha.NumberRC[iLinha, 15]    := fVlrOrcSem1 - fVlrRealSem1;

               if fVlrOrcSem1 <> 0 then
               begin
                  Planilha.NumberRC[iLinha, 16] := (fVlrOrcSem1 - fVlrRealSem1) / fVlrOrcSem1 * 1;
               end
               else
               begin
                  Planilha.NumberRC[iLinha, 16] := 1;
               end;

               // ----------------------------------------------------------------------------------

               Planilha.NumberRC[iLinha, 19] := fVlrOrcSem2;
               Planilha.NumberRC[iLinha, 27] := fVlrRealSem2;
               Planilha.NumberRC[iLinha, 28] := fVlrOrcSem2 - fVlrRealSem2;

               if fVlrOrcSem2 <> 0 then
               begin
                  Planilha.NumberRC[iLinha, 29] := (fVlrOrcSem2 - fVlrRealSem2) / fVlrOrcSem2;
               end
               else
               begin
                  Planilha.NumberRC[iLinha, 29] := 1;
               end;

               // ----------------------------------------------------------------------------------

               Planilha.NumberRC[iLinha, 31] := fVlrOrcSem1 + fVlrOrcSem2;
               Planilha.NumberRC[iLinha, 32] := fVlrRealSem1 + fVlrRealSem2;
               Planilha.NumberRC[iLinha, 33] := (fVlrOrcSem1 + fVlrOrcSem2) - (fVlrRealSem1 + fVlrRealSem2);

               if (fVlrOrcSem1 + fVlrOrcSem2) <> 0 then
               begin
                  Planilha.NumberRC[iLinha, 34] := ((fVlrOrcSem1 + fVlrOrcSem2) - (fVlrRealSem1 + fVlrRealSem2)) / (fVlrOrcSem1 + fVlrOrcSem2);
               end
               else
               begin
                  Planilha.NumberRC[iLinha, 34] := 1;
               end;

               // ----------------------------------------------------------------------------------
            end;

            qryConta.Next;
         end;  // while not(qryConta.EOF)

         qryGrupo.Next;
      end;  // while not(qryGrupo.EOF)

   finally
      frmProgressoDuplo.EscondeFormProgressoDuplo;

      pgc.ActivePage := tbsResult;
   end;
end;



procedure TfrmConsOrcadoXRealizadoSemestre.FormShow(Sender: TObject);
begin
   inherited;

//   sqlPlano.Open;

   with molPlano,sqlPlanoOrcamen do
   begin
      Prepare;
      Open;
   end;

   cdsGrupo.Close;
   sqlGrupo.Prepare;
   sqlGrupo.ParamByName('PIDPLANOORCAMEN').AsInteger := StrToInt(molPlano.cboPlanoOrcamen.LookupValue);
   sqlGrupo.Open;

   DBspnExercicio.Value := DiasUteis.ExtraiAno(Date);
end;



procedure TfrmConsOrcadoXRealizadoSemestre.btnLimpaCliClick(Sender: TObject);
begin
   inherited;

   DBcboGrupoOrcamen.LookupValue := '';
   DBcboGrupoOrcamen.Text        := '';
end;



procedure TfrmConsOrcadoXRealizadoSemestre.molPlanocboPlanoOrcamenCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   cdsGrupo.Close;
   sqlGrupo.Prepare;
   sqlGrupo.ParamByName('PIDPLANOORCAMEN').AsInteger := StrToInt(molPlano.cboPlanoOrcamen.LookupValue);
   sqlGrupo.Open;
end;

end.
