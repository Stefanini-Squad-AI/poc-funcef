unit fCancelar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, uMensErro, dbTables,
  Db, Wwquery, wwdblook, CMDBLookupCombo;

type
  TfrmCancelar = class(TfrmOkCancelar)
    pnlTitular: TPanel;
    lblPart: TLabel;
    Label1: TLabel;
    lblDepen: TLabel;
    Label2: TLabel;
    lblMatricula: TLabel;
    Label9: TLabel;
    lblInscricao: TLabel;
    Label3: TLabel;
    lblPlanoAssist: TLabel;
    Label11: TLabel;
    lblDependencia: TLabel;
    Label7: TLabel;
    lblDtInscricao: TLabel;
    grpDadosBenef: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    dtDataCancel: TCMDateTimePicker;
    memObsCancel: TMemo;
    Label8: TLabel;
    CMDBSituacao: TCMDBLookupCombo;
    Label4: TLabel;
    qrySituacao: TwwQuery;
    qrySituacaoIDSITPLANOASS: TFloatField;
    qrySituacaoDESCRICAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure InsertFiario(Ms:String);
  public
    { Public declarations }
    iMenu  : Integer;
  end;

var
  frmCancelar: TfrmCancelar;

implementation

uses FCadGeralPart, DBaseDados, USistema, UAdmAss;

{$R *.DFM}

procedure TfrmCancelar.FormCreate(Sender: TObject);
begin
  inherited;
  iMenu:=frmCadGeralPart.iMenu;
  If frmCadGeralPart.sOpcao = 'PART'
   Then Caption:='Cancelamento do Participante '+frmCadGeralPart.qryNOME.AsString
   Else If frmCadGeralPart.sOpcao = 'PLAN'
         Then Caption:='Cancelamento do Plano '+frmCadGeralPart.qryPlanoPLANO.AsString
         Else Caption:='Cancelamento do Beneficiário '+frmCadGeralPart.qryBenefNOME.AsString;
  lblPart.Caption       := frmCadGeralPart.qryNOME.AsString;
  lblDepen.Caption      := frmCadGeralPart.qryBenefNOME.AsString;
  lblMatricula.Caption  := frmCadGeralPart.qryMATRICULA.AsString;
  lblInscricao.Caption  := frmCadGeralPart.qryINSCRICAONUMERO.AsString;
  lblPlanoAssist.Caption:= frmCadGeralPart.qryPlanoPLANO.AsString;
  lblDependencia.Caption:= frmCadGeralPart.qryBenefDEPENDENCIA.AsString;
  lblDtInscricao.Caption:= frmCadGeralPart.qryINSCRICAODATA.AsString;
  qrySituacao.Open;
end;

procedure TfrmCancelar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrySituacao.Close;
  frmCadGeralPart.CmeCadastroFind(self);
  frmCadGeralPart.WindowState:=wsMaximized;
end;

Procedure TfrmCancelar.InsertFiario(Ms:String);
begin
  (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
  FazerInsertFiario(frmCadGeralPart.qryCHAVE.AsInteger,frmCadGeralPart.qryCHAVE.AsInteger,
                     Sistema.IdUsuario, Sistema.IdModulo, Ms);
end;

procedure TfrmCancelar.bbtnConfirmarClick(Sender: TObject);
Var qryAux        :   TQuery;
    sSQL          :   String;
begin
  If  MsgDlg('Confirma Cancelamento?.','Confirmação',
              mtError,[mbOk,mbHelp],0) = mrOk then
  begin
    If dtDataCancel.Text <> Null Then
    begin
      If CMDBSituacao.Text <> Null then
      begin
        If memObsCancel.Lines.Text <> Null Then
        begin
          qryAux:=Tquery.Create(Application);
          qryAux.DatabaseName:='BaseDados';
         (*  Rotina de Gravação de Dados  *)
          Case iMenu Of
            1 : begin  { Cancelamento de Participante }

                 dtmBaseDados.dbBaseDados.StartTransaction;
                 Try
               (*    Alteração na PARTASS    *)
                  sSQL:='UPDATE PARTASS'+#13+
                        'SET IDSITPART = '+qrySituacao.FieldByName('IdSitPlanoAss').AsString+','+#13+
                        'FLGINSCRICAOCANC = 1,'+#13+
                        'DATACANCELAMENTO = TO_DATE('''+DateToStr(dtDataCancel.Date)+''',''DD/MM/YYYY''),'+#13+
                        ' OBSCANCEL        = '+Chr(39)+memObsCancel.Lines.Text+Chr(39)+#13+
                        'WHERE (IDPESSOA  = '+frmCadGeralPart.qryCHAVE.AsString+')';
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(sSQL);
                  qryAux.ExecSQL;
               (*     Alteração na BENEFASS  *)
                  sSQL:='UPDATE BENEFASS'+#13+
                        'SET FLGATIVO = 0, DTCANCELAMENTO = TO_DATE('''+DateToStr(dtDataCancel.Date)+''',''DD/MM/YYYY''),'+#13+
                        '    OBSCANCEL      = '+Chr(39)+memObsCancel.Lines.Text+Chr(39)+#13+
                        'WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+')';
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(sSQL);
                  qryAux.ExecSQL;
               (*     Alteração na CONTASS   *)
                  sSQL:='UPDATE CONTASS '+#13+
                        'SET FLGATIVO = 0 '+#13+
                        'WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+')';
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(sSQL);
                  qryAux.ExecSQL;

                  (* Se todos os updates derem certo, então valida a transação (commit) *)
                  dtmBaseDados.dbBaseDados.Commit;

                  (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
                  InsertFiario('CANCELAMENTO DE PARTICIPANTE EM PLANO ASSISTENCIAL');

                  ShowMessage('Cancelamento do participante efetuado com sucesso.');
                 Except
                  (* Algum update retornou erro - retorna a transação (rollback) *)
                  dtmBaseDados.dbBaseDados.Rollback;
                  ShowMessage('Ocorreu um erro durante a transação.'+#13+
                              '    Cancelamento não efetuado.     ');
                 End;
                End;
            2 : Begin     (* Cancelamento do Plano Selecionado *)
                 dtmBaseDados.dbBaseDados.StartTransaction;
                 Try
                  (*         Alteração na PARTASS        *)
                  sSQL:='UPDATE PARTASS'+#13+
                        'SET IDSITPART = '+qrySituacao.FieldByName('IdSitPlanoAss').AsString+','+#13+
                        'FLGINSCRICAOCANC = 1,'+#13+
                        'DATACANCELAMENTO = TO_DATE('''+DateToStr(dtDataCancel.Date)+''',''DD/MM/YYYY''),'+#13+
                        ' OBSCANCEL        = '+Chr(39)+memObsCancel.Lines.Text+Chr(39)+#13+
                        'WHERE (IDPESSOA  = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                        '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(sSQL);
                  qryAux.ExecSQL;
                  (*         Alteração na BENEFASS        *)
                  sSQL:='UPDATE BENEFASS'+#13+
                        'SET FLGATIVO = 0, DTCANCELAMENTO = TO_DATE('''+DateToStr(dtDataCancel.Date)+''',''DD/MM/YYYY''),'+#13+
                        '    OBSCANCEL      = '+Chr(39)+memObsCancel.Lines.Text+Chr(39)+#13+
                        'WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                        '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(sSQL);
                  qryAux.ExecSQL;
                  (*         Alteração na CONTASS         *)
                  sSQL:='UPDATE CONTASS '+#13+
                        'SET FLGATIVO = 0 '+#13+
                        'WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                        '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(sSQL);
                  qryAux.ExecSQL;

                  (*  Se todos os updates derem certo, então valida a transação (commit) *)
                  dtmBaseDados.dbBaseDados.Commit;

                  (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
                  InsertFiario('CANCELAMENTO DE PLANO ASSISTENCIAL DO PARTICIPANTE');

                  ShowMessage('Cancelamento do plano efetuado com sucesso.');
                 Except
                  (* Algum update retornou erro - retorna a transação (rollback) *)
                  dtmBaseDados.dbBaseDados.Rollback;
                  ShowMessage('Ocorreu um erro durante a transação.'+#13+
                              '    Cancelamento não efetuado.     ');
                 End;
                End;
            3 : Begin       (* Cancelamento do Beneficiário Selecionado *)
                 dtmBaseDados.dbBaseDados.StartTransaction;
                 Try
                  (*       Alteração na BENEFASS        *)
                  sSQL:='UPDATE BENEFASS'+#13+
                        'SET FLGATIVO = 0, DTCANCELAMENTO = TO_DATE('''+DateToStr(dtDataCancel.Date)+''',''DD/MM/YYYY''),'+#13+
                        '    OBSCANCEL      = '+Chr(39)+memObsCancel.Lines.Text+Chr(39)+#13+
                        'WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                        '  AND (IDDEPENDENTE = '+frmCadGeralPart.qryBenefIDPESSOA.AsString+')'+#13+
                        '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(sSQL);
                  qryAux.ExecSQL;
                  (*        Alteração na CONTASS        *)
                  sSQL:='UPDATE CONTASS '+#13+
                        'SET FLGATIVO = 0 '+#13+
                        'WHERE (IDTITULAR     = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                        '  AND (IDDEPENDENTE  = '+frmCadGeralPart.qryBenefIDPESSOA.AsString+')'+#13+
                        '  AND (IDPLANASS     = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add(sSQL);
                  qryAux.ExecSQL;

                  (* Se todos os updates derem certo, então valida a transação (commit) *)
                  dtmBaseDados.dbBaseDados.Commit;

                  (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
                  InsertFiario('CANCELAMENTO DE BENEFICIARIO NO PLANO ASSISTENCIAL');

                  ShowMessage('Cancelamento do plano efetuado com sucesso.');
                 Except
                  (* Algum update retornou erro - retorna a transação (rollback) *)
                  dtmBaseDados.dbBaseDados.Rollback;
                  ShowMessage('Ocorreu um erro durante a transação.'+#13+
                              '    Cancelamento não efetuado.     ');
                 End;
                End;
          End;
        end else ShowMessage('Informe o motivo do cancelamento.');
      end else ShowMessage('Informe a data do cancelamento.');
    end else ShowMessage('Informe o motivo do cancelamento.');
  end;
end;

end.
