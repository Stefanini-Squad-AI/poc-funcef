{-------------------------------------------------------------------------------
 Autor     : Marcus Oliveira
 Data      : 25/09/2006
 Pendência : 23034
 Descrição : Incluir opção de filtro por Centro de responsabilidade.
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
 Autor     : Rodolpho da Silva
 Data      : 28/10/2005
 Pendência : 20090
 Descrição : Incluir no MontaSelect a opção de filtro por Grupo de Contas Orçamentárias
-------------------------------------------------------------------------------}
{******************************************************************************}
{* Marcio Motta - 31/03/2005                                                  *}
{* Pendência 18032                                                            *}
{******************************************************************************}

unit fRParamTotCenRespMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, Wwdatsrc, ComCtrls, CMTree, Mask,
  wwdbdatetimepicker, CMDateTimePicker, MontaSelect, mPlanoOrcamentarioMT,
  wwdblook, CMDBLookupCombo, usistema ;

type
  TfrmRParamTotCenRespMT = class(TfrmParamReports_Padrao)
    MontaSelectConta: TMontaSelect;
    lblDataIni: TLabel;
    dteDataIni: TCMDateTimePicker;
    Label1: TLabel;
    dteDataFim: TCMDateTimePicker;
    lblCodigoConta: TLabel;
    edtCodigoConta: TEdit;
    bbtnBuscaConta: TBitBtn;
    edtNomeConta: TEdit;
    lblGrupo: TLabel;
    rdgOrdenacao: TRadioGroup;
    dsGrupo: TwwDataSource;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    molPlanoOrcamentario: TmolPlanoOrcamentario;
    cboGrupoOrcamen: TwwDBLookupCombo;
    SQLResponsab: TCMSqlParams;
    cdsResponsab: TCMClientDataSet;
    cmblkResponsab: TCMDBLookupCombo;
    Label2: TLabel;
    cdsGrupoIDGRUPOORCAMEN: TFloatField;
    cdsGrupoNOMEGRUPOORCAMEN: TStringField;
    cdsGrupoFLGANALSINT: TStringField;
    cdsGrupoCODGRUPOORC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure edtCodigoContaExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molPlanoOrcamentariocboPlanoOrcamenCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure cmblkResponsabCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamTotCenRespMT: TfrmRParamTotCenRespMT;

implementation

uses UModulo, UCtrlOrcamento, UMensErro;

{$R *.DFM}

procedure TfrmRParamTotCenRespMT.FormCreate(Sender: TObject);
begin
  inherited;

 with SQLResponsab do
   begin
     Prepare;
     ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     Open;
   end;

  with molPlanoOrcamentario,sqlPlanoOrcamen do
    begin
      Prepare;
      Open;
    end;

  with sqlGrupo do
    begin
      cdsGrupo.Close;
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
      Open;
    end;

  // Prepara filtro da MontaSelect
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +
                              molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);


end;

procedure TfrmRParamTotCenRespMT.bbtnBuscaContaClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelectConta.Executar;
  if MontaSelectConta.RetornouValor then
    begin
      if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
         MontaSelectConta.ValoresChave[1], true, false, sNomeConta,
         sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid,
         sPPrev, sCCusto, sPatro) = 0 then
        begin
          edtCodigoConta.text := MontaSelectConta.ValoresChave[1];
          edtNomeConta.text  := sNomeConta;
        end
      else
    begin
      edtCodigoConta.SetFocus;
    end;
  end;
end;

procedure TfrmRParamTotCenRespMT.edtCodigoContaExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if Trim(edtCodigoConta.text) <> '' then
    begin
      if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc, edtCodigoConta.text,
         true, false, sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
         sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro) = 0 then
        begin
          edtNomeConta.text  := sNomeConta;
        end
      else
        begin
          edtCodigoConta.SetFocus;
        end;
    end;
end;

procedure TfrmRParamTotCenRespMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //Filtra os dados da tela para passar para o relatório
  if Trim(molPlanoOrcamentario.cboPlanoOrcamen.text) = '' then
    begin
      MsgDlg('O plano Orçamentário deve ser definido.','Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
    end
  else
    if not ((Trim(dteDataIni.Text) = '') or (Trim(dteDataFim.Text) = '')) then
      begin
        //Verifica se a data final é maior ou igual à inicial
        if OrcamentoBackMT.VerificaDatas(dteDataIni.date, dteDataFim.date) then
          begin
            Cmp_Padrao.ParamValues[0].AsDateTime := dteDataIni.Date;
            Cmp_Padrao.ParamValues[1].AsDateTime := dteDataFim.Date;
            Cmp_Padrao.ParamValues[2].AsString   := Trim(edtCodigoConta.Text);
            Cmp_Padrao.ParamValues[3].AsString   := Trim(edtNomeConta.Text);

            if (Trim(cboGrupoOrcamen.LookupValue) = '') then
              Cmp_Padrao.ParamValues[4].AsInteger := 0
            else
              begin
                if cdsGrupo.Locate('IDGRUPOORCAMEN', StrToInt(Trim(cboGrupoOrcamen.LookupValue)), []) then
                  Cmp_Padrao.ParamValues[4].AsInteger := cdsGrupoIDGRUPOORCAMEN.AsInteger
                else
                  Cmp_Padrao.ParamValues[4].AsInteger := 0;
              end;

            Cmp_Padrao.ParamValues[5].AsInteger  := rdgOrdenacao.ItemIndex;
            Cmp_Padrao.ParamValues[6].AsInteger  := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
          end
        else
          begin
            MsgDlg('Data Inicial poterior à Data Final.','Erro',mtError,[mbOk],0);
            modalResult := mrNone;
          end;
      end
    else
      begin
        MsgDlg('O Período de Datas de Referência deve ser preenchido.','Erro', mtError,[mbOk],0);
        modalResult := mrNone;
      end;
end;

procedure TfrmRParamTotCenRespMT.molPlanoOrcamentariocboPlanoOrcamenCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with sqlGrupo do
    begin
      cdsGrupo.Close;
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
      Open;
    end;

  // Prepara filtro da MontaSelect
  MontaSelectConta.Filtro.Delete(0);
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +
                              molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
end;

procedure TfrmRParamTotCenRespMT.cmblkResponsabCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  Cmp_Padrao.ParamValues[7].AsString:= cmblkResponsab.LookupValue;

end;

end.
