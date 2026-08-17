// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendencia :
Descrição :
---------------------------------------------------------------------------------------------------}

unit FExecReplicaCriterio;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, uCmSqlParams, Db,
   DBClient, uCMClientDataSet, uCtrlCadValCriterioRat;

type
   TfrmExecReplicaCriterio = class(TfrmOkCancelar)
    DBcboRateio: TCMDBLookupCombo;
      lblCriterio: TLabel;
      lblExercicio: TLabel;
    DBcboExercicioOri: TCMDBLookupCombo;
      ToolbarSep972: TToolbarSep97;
      ToolbarSep973: TToolbarSep97;
      ToolbarSep974: TToolbarSep97;
      cdsCriterio: TCMClientDataSet;
      Bevel1: TBevel;
      Label1: TLabel;
    DBcboExercicioFim: TCMDBLookupCombo;
      cdsExercicioFim: TCMClientDataSet;
      sqlExercicioFim: TCMSqlParams;
      sqlExercicioOri: TCMSqlParams;
      cdsExercicioOri: TCMClientDataSet;
      cdsCriterioIDCRITERIORATORC: TFloatField;
      cdsCriterioDESCRICAO: TStringField;
      sqlTeste: TCMSqlParams;
      cdsExercicioOriEXERCICIO: TFloatField;
    cdsExistencia: TCMClientDataSet;

      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);
      procedure DBcboRateioCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure bbtnConfirmarClick(Sender: TObject);


   private  // Private declarations

      CtrlCadValCriterioRat : TCtrlCadValCriterioRat;

      function  VerificaPreenchimento: boolean;


   public   // Public declarations

   end;



var
  frmExecReplicaCriterio: TfrmExecReplicaCriterio;



implementation
{$R *.DFM}
uses
   uSistema, dBaseDados, uDataBase, uVerificaPreenchimento, uMensErro;




function TfrmExecReplicaCriterio.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if DBcboRateio.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Critério de Rateio!', DBcboRateio);

      if DBcboExercicioOri.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Critério de Rateio!', DBcboExercicioOri);

      if DBcboExercicioFim.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Critério de Rateio!', DBcboExercicioFim);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;




procedure TfrmExecReplicaCriterio.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlCadValCriterioRat := TCtrlCadValCriterioRat.Create;

   CtrlCadValCriterioRat.Initialize(DtmBaseDados.dbBaseDados,
                                    True,
                                    Sistema.ConnectionType,
                                    Sistema.ConnectionSide,
                                    Sistema.AppRemoteServer,
                                    True,
                                    nil,
                                    nil,
                                    False
                                   );

   CtrlCadValCriterioRat.IDEmpresa := Sistema.IDEmpresa;
end;



procedure TfrmExecReplicaCriterio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   cdsCriterio.Close;
   cdsExercicioOri.Close;
   cdsExercicioFim.Close;

   inherited;
end;



procedure TfrmExecReplicaCriterio.FormShow(Sender: TObject);
begin
   inherited;

   cdsCriterio.Data  := CtrlCadValCriterioRat.ListaCriterio;

   sqlExercicioFim.Prepare;
   sqlExercicioFim.ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
   sqlExercicioFim.Open;
end;



procedure TfrmExecReplicaCriterio.DBcboRateioCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if DBcboRateio.LookupValue <> '' then
   begin
      cdsExercicioOri.Close;

      sqlExercicioOri.Prepare;
      sqlExercicioOri.ParamByName('PIDCRITERIORATORC').AsInteger   := StrToInt(DBcboRateio.LookupValue);
      sqlExercicioOri.ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
      sqlExercicioOri.Open;
   end
   else
   begin
      cdsExercicioOri.Close;
   end;
end;



procedure TfrmExecReplicaCriterio.bbtnConfirmarClick(Sender: TObject);
var
   bApaga  : Boolean;
   bInsere : Boolean;
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   bApaga  := False;
   binsere := True;

   // ----------------------------------------------------------------------------------------------
   // 1) Verifica se existem dados no período FIM selecionado
   cdsExistencia.Data := CtrlCadValCriterioRat.ListaCriterioPorExercicio(StrToInt(DBcboRateio.LookupValue),
                                                                         StrToInt(DBcboExercicioFim.LookupValue)
                                                                        );

   if not(cdsExistencia.IsEmpty) then
   begin
      bInsere  := False;

      if MsgDlg('Já há valor(es) cadastrado(s) para o Exercício selecionado!' +
                'Deseja sobrescrever esses valores?', 'Orçamento',
                mtConfirmation, [mbyes, mbNo], 0) = mrYes then
      begin
         Repaint;
         bApaga   := True;
         bInsere  := True;
      end;

      Repaint;
   end;

   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // 2) Se sim, e msg = mrYes, faz delete
   if bApaga then
   begin
      StartTransacao;

      if not(CtrlCadValCriterioRat.ExcluiCriterioPorExercicio(StrToInt(DBcboRateio.LookupValue),
                                                          StrToInt(DBcboExercicioFim.LookupValue)
                                                         )) then
      begin
         RollbackTransacao;

         bInsere := False;
         MsgDlg('Ocorreu um ERRO ao tentar excluir os valores já cadastrados para o Exercício ' +
                'selecionado!', 'Orçamento', mtError, [mbOk], 0);
         Repaint;
      end;
   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // 3) Faz insert com select
   if bInsere then
   begin
      if CtrlCadValCriterioRat.ReplicaCriterio(StrToInt(DBcboRateio.LookupValue),
                                               StrToInt(DBcboExercicioOri.LookupValue),
                                               StrToInt(DBcboExercicioFim.LookupValue)
                                              ) then

      begin
         CommitTransacao;

         MsgDlg('Valores replicados.', 'Orçamento', mtInformation, [mbOk], 0);
         Repaint;
      end
      else
      begin
         RollbackTransacao;

         MsgDlg('Ocorreu um ERRO ao tentar excluir os valores já cadastrados para o Exercício ' +
                'selecionado!', 'Orçamento', mtError, [mbOk], 0);
         Repaint;
      end;
   end;
   // ----------------------------------------------------------------------------------------------
end;



end.
