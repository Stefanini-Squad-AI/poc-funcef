{ --------------------------------------------------------------------------------------------------
Data      : 30/08/2006
Autor     : Marcus Santos Oliveira
Pendencia : 23203
Descrição : Cadastro do Desvio Padrão
---------------------------------------------------------------------------------------------------}

unit fCadDesvioPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBCtrls, wwdblook, CMDBLookupCombo,
  uCmSqlParams, uCtrlCadDesvioPadrao, uCMTypes, uMensErro, uCtrlPadroes;

type
  TfrmCadDesvioPadrao = class(TFrmCadastroGridMT)
    cmlkTipoMovim: TCMDBLookupCombo;
    lblTipoMovim: TLabel;
    dbrgpValPerc: TDBRadioGroup;
    dbEdtMediaLanctos: TDBEdit;
    dbEdtValorDesvio: TDBEdit;
    lblMediaLancto: TLabel;
    lblValorDesvio: TLabel;
    CdsCmLkTipoMovimentacao: TCMClientDataSet;
    dbVerificaTipo: TDBRadioGroup;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlCadDesvio: TCtrlCadDesvioPadrao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDesvioPadrao: TfrmCadDesvioPadrao;

implementation

{$R *.DFM}

procedure TfrmCadDesvioPadrao.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept :=  CtrlCadDesvio.GravaDadosDesvio;
  if Not Accept then
     MsgDlg(CtrlCadDesvio.MessageInfo, 'Atenção', mtError, [MbOk], 0);

end;

procedure TfrmCadDesvioPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  //Cria a classe e carrega o CDS
    CtrlCadDesvio:=TCtrlCadDesvioPadrao.Create;
    CtrlCadDesvio.InitializeAs(padroes);
    CtrlCadDesvio._Cds:=Cds;
    Cds.data:= CtrlCadDesvio.CarregaDesvio;
  //Carrega a combo

    CdsCmLkTipoMovimentacao.data := CtrlCadDesvio.CarregaLkTipoMovim;

  //Atualiza Botoes o Idle carrega quando está vazio.
    CmeCadastro.Operacao := opIdle;
    CmeCadastro.AtualizaBotoes(Self);

    TFloatField(cds.FieldByName('MEDIALANCTOS')).DisplayFormat:='#,##0.00';
    TFloatField(cds.FieldByName('VALORDESVIO')).DisplayFormat:='#,##0.00';

end;

procedure TfrmCadDesvioPadrao.dbGrdDblClick(Sender: TObject);
begin
  inherited;
  if not Cds.IsEmpty then sbtnAlterarClick( Self );

end;

procedure TfrmCadDesvioPadrao.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlCadDesvio.Free;
end;

procedure TfrmCadDesvioPadrao.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
    TFloatField(cds.FieldByName('MEDIALANCTOS')).DisplayFormat:='#,##0.00';
    TFloatField(cds.FieldByName('VALORDESVIO')).DisplayFormat:='#,##0.00';
    Cds.data:= CtrlCadDesvio.CarregaDesvio;
          
end;

procedure TfrmCadDesvioPadrao.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  if Trim (cmlkTipoMovim.Text) = '' then
  begin
    MsgDlg('Tipo de movimento não selecionado.','Atenção', mtWarning, [mbOk], 0);
    cmlkTipoMovim.SetFocus;
    Accept:= False;
  end else

    if Trim (dbEdtMediaLanctos.Text) = '' then
    begin
      MsgDlg('Média de lançamento não informada.','Atenção', mtWarning, [mbOk], 0);
      dbEdtMediaLanctos.SetFocus;
      Accept:=False;
    end else

      if Trim (dbEdtValorDesvio.Text) = '' then
      begin
        MsgDlg('Valores de desvio não informado.','Atenção', mtWarning, [mbOk], 0);
        dbEdtValorDesvio.SetFocus;
        Accept:= False;
      end else
        Accept:=True;

end;

procedure TfrmCadDesvioPadrao.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  //Valores padrões
  dbrgpValPerc.ItemIndex:=0;
  dbVerificaTipo.ItemIndex:=0;
end;

procedure TfrmCadDesvioPadrao.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  cds.Data:= CtrlCadDesvio.CarregaDesvio;
end;

end.
