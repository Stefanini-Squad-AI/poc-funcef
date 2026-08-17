unit FCadDependenteAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc,
  Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  checklst, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, TB97Ctls, TB97Tlbr, Wwdbspin, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, TREdit;

type
  TfrmCadDependenteAss = class(TfrmPessoa)
    tddepend: TTabSheet;
    Label24: TLabel;
    cmbsitdependente: TwwDBLookupCombo;
    qrySitDependente: TwwQuery;
    tbsPessFis: TTabSheet;
    pnlPessFis: TPanel;
    DBCheckBox1: TDBCheckBox;
    dbrgrpSexo: TDBRadioGroup;
    dbrgrpEstCivil: TDBRadioGroup;
    grpFiliacao: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    grpNaturalidade: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    dblkpcmbNaturalidade: TwwDBLookupCombo;
    dbedNacionalidade: TwwDBEdit;
    grpDataNasc: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    wwDBEdit4: TwwDBEdit;
    dbdtNasc: TCMDateTimePicker;
    grpDependentes: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    wwDBSpinEdit2: TwwDBSpinEdit;
    wwDBSpinEdit3: TwwDBSpinEdit;
    qryNaturalidade: TwwQuery;
    qryBanco: TwwQuery;
    qryAgencia: TwwQuery;
    tbsContasBancarias: TTabSheet;
    qryContaBancaria: TwwQuery;
    dsContaBancaria: TwwDataSource;
    dbgrdContaBancaria: TwwDBGrid;
    Panel3: TPanel;
    GroupBoxBanco: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    dblkpcmbAgencia: TwwDBLookupCombo;
    dblkpcmbBanco: TwwDBLookupCombo;
    GroupBoxConta: TGroupBox;
    Label40: TLabel;
    dbedContaCorrente: TwwDBEdit;
    dbcbFlgContaPref: TDBCheckBox;
    updContaBancaria: TUpdateSQL;
    qryAux: TwwQuery;
    dbckDesignado: TDBCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryPessoaFisicaAfterInsert(DataSet: TDataSet);
    procedure dblkpcmbNaturalidadeCloseUp(Sender: TObject; LookupTable,
              FillTable: TDataSet; modified: Boolean);
    procedure dsPessoaFisicaStateChange(Sender: TObject);
    procedure dblkpcmbBancoCloseUp(Sender: TObject; LookupTable,
              FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbAgenciaEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryContaBancariaAfterInsert(DataSet: TDataSet);
    procedure qryContaBancariaBeforePost(DataSet: TDataSet);
    procedure qrySubTipoAfterScroll(DataSet: TDataSet);
    procedure qrySubTipoAfterInsert(DataSet: TDataSet);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure PessoaSaveSubtipo(Sender: TObject);
    Procedure PessoaChangeSubtipo(IdPessoa: Integer);
  private
    { Private declarations }
    bAssociaAoTitular : boolean;
    sNomeParticipante, sNomePatro, sNomePlano, sMatricula : string;
    iIdPlanoPrev, iIdPatrocin, iIdParticipante : longint;

  public
    { Public declarations }
    procedure CadDepenTit(psNomeParticipante, psNomePatro, psNomePlano, psMatricula : string;
              piIdPlanoPrev, piIdPatrocin, piIdParticipante : longint);
  end;

var
  frmCadDependenteAss: TfrmCadDependenteAss;

implementation

uses FTelaAut, UMensErro, UDataBase,DBaseDados, UParticipante, FPedeDadosDependencia;

{$R *.DFM}

procedure TfrmCadDependenteAss.CadDepenTit(psNomeParticipante, psNomePatro, psNomePlano,
          psMatricula : string; piIdPlanoPrev, piIdPatrocin, piIdParticipante : longint);
begin
   bAssociaAoTitular := true;
   sNomeParticipante := psNomeParticipante;
   sNomePatro        := psNomePatro;
   sNomePlano        := psNomePlano;
   sMatricula        := psMatricula;
   iIdPlanoPrev      := piIdPlanoPrev;
   iIdPatrocin       := piIdPatrocin;
   iIdParticipante   := piIdParticipante;
   Show;
end;

procedure TfrmCadDependenteAss.PessoaChangeSubtipo(IdPessoa: Integer);
begin
   if qryContaBancaria.Active and qryContaBancaria.CachedUpdates then
     qryContaBancaria.CancelUpdates;
   qryContaBancaria.ParamByName('IDPESSOA').Value := IdPessoa;
   qryContaBancaria.Close;
   qryContaBancaria.Open;
   qryContaBancaria.CancelUpdates;
end;

procedure TfrmCadDependenteAss.PessoaSaveSubtipo(Sender: TObject);
begin
   inherited;
   try
     dtmBaseDados.dbBaseDados.ApplyUpdates([qryContaBancaria]);
   except
      raise;
   end;
end;

procedure TfrmCadDependenteAss.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   try
      qryContaBancaria.CancelUpdates;
   except
   end;
end;

procedure TfrmCadDependenteAss.FormActivate(Sender: TObject);
begin
  inherited;
  qrysitdependente.Close; qrysitdependente.open;
  qryNaturalidade.Close;  qryNaturalidade.Open;
  qryAgencia.Close;       qryAgencia.Open;
  qryBanco.Close;         qryBanco.Open;
  qryContaBancaria.Prepare;
end;

procedure TfrmCadDependenteAss.bbtnConfirmarClick(Sender: TObject);
var bGravaDependente : boolean;
    sNomeDependenteAnt, sIdDependenteAnt, sIdDependencia : string;
    iFlgContaIR, iFlgContaSalF, iNumSequencia  : longint;
begin
  bGravaDependente := true;

  if qry.State = dsInsert then
  begin
     if bAssociaAoTitular then
     begin
        if MsgDlg('Deseja associar este dependente ao participante '+sNomeParticipante+
                  ' neste momento ? ', 'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
        begin
           if MsgDlg('Deseja apenas cadastrar o dependente no sistema, sem associá-lo '+
                     ' ao participante ? ', 'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
           begin
              bGravaDependente  := false;
              bAssociaAoTitular := false;
           end
           else
           begin
              bGravaDependente  := true;
              bAssociaAoTitular := false;
           end;
        end
        else
        begin
           bGravaDependente := true;
           bAssociaAoTitular := true;
        end;
     end; // if bAssociaAoTitular
  end // if state = insert
  else
    bAssociaAoTitular := false;

  if not bGravaDependente then
  begin
     bbtnCancelarClick(Sender);
     Abort;
  end;
  sNomeDependenteAnt := qry.FieldByName('Nome').AsString;
  sIdDependenteAnt   := qry.FieldByName('IdPessoa').AsString;

  inherited;

  if bAssociaAoTitular then
  begin
     iNumSequencia := ProximaSequenciaDependente(iIdParticipante, qryAux);
     frmPedeDadosDependencia.PedeDadosDependencia(sNomeParticipante,
                                                  sNomeDependenteAnt,
                                                  sMatricula,
                                                  sIdDependencia,
                                                  iNumSequencia,
                                                  iFlgContaIR,
                                                  iFlgContaSalF);
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.sql.add('INSERT INTO DEPENTIT(IDPESSOA,IDTITULAR,NUMSEQUENCIA,'+
                               ' FLGCONTAIMPOSTOR,FLGCONTASALARIOF,IDDEPENDENCIA) '+
                    ' VALUES('+sIdDependenteAnt+','+
                              IntToStr(iIdParticipante)+','+
                              IntToStr(iNumSequencia)+','+
                              inttostr(iFlgContaIR)+','+
                              inttostr(iFlgContaSalF)+','+
                              ''''+sIdDependencia+''')');
     try
        qryAux.ExecSQL;
     except
        MsgDlg('Ocorreu um erro na associação do dependente ao titular. '+
               'Os dados do dependente já foram gravados. O dependente apenas '+
               ' não foi associado ao participante. Verifique. ','Aviso',mtError,[mbOk],0);
        exit;
     end;
  end;
end;

procedure TfrmCadDependenteAss.qryPessoaFisicaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dblkpcmbNaturalidade.Text := '';
  dbedNacionalidade.Text := '';
  qryPessoaFisica.FieldByName('flgIsentoIRRF').AsInteger := 0;
end;

procedure TfrmCadDependenteAss.dblkpcmbNaturalidadeCloseUp( Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPessoaFisica.FieldbyName('IdPais').AsInteger := qryNaturalidade.FieldByName('IdPais').AsInteger;
end;

procedure TfrmCadDependenteAss.dsPessoaFisicaStateChange(Sender: TObject);
begin
  inherited;
  pnlPessFis.Enabled := (dsPessoaFisica.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TfrmCadDependenteAss.dblkpcmbBancoCloseUp(Sender: TObject; LookupTable,
          FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryContaBancaria.FieldbyName('BANCO').AsString := qryBanco.FieldByName('BANCO').AsString;
end;

procedure TfrmCadDependenteAss.dblkpcmbAgenciaEnter(Sender: TObject);
begin
  inherited;
  qryAgencia.Close;
  qryAgencia.ParamByName('pIdBanco').AsString := qryBanco.FieldbyName('IDPESSOA').AsString;
  qryAgencia.Open;
end;

procedure TfrmCadDependenteAss.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryContaBancaria.Close;
  qryContaBancaria.Unprepare;
end;

procedure TfrmCadDependenteAss.qryContaBancariaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryContaBancaria.FieldByName('FLGCONTAPREF').AsInteger := 1;
end;

procedure TfrmCadDependenteAss.qryContaBancariaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryContaBancaria.State = dsInsert then
    qryContaBancaria.FieldByName('IDCBANCARIA').AsInteger := LeUltRegistro(qryAux,'CONTABANCARIA');
end;

procedure TfrmCadDependenteAss.qrySubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qrySubTipo.Active then
    dbckDesignado.Checked := (qrySubTipo.FieldByName('FlgDesignado').AsInteger = 1);
end;

procedure TfrmCadDependenteAss.qrySubTipoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if qrySubTipo.Active then
    dbckDesignado.Checked := (qrySubTipo.FieldByName('FlgDesignado').AsInteger = 1);
end;

end.
