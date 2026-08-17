// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Data        : 18/05/2007
// Pendencia   : 19937
// Alteração   : Retirar os botões de alterar e excluir do mestre
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 16/06/2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 20/03/2003
// Alteração   : alteração do script de Update do updDet, que estava com o camdpo IDREGRA
//               duplicado
//
//------------------------------------------------------------------------------
unit FCadConfigTransfPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  DBCtrls, Mask, wwdbedit, wwdblook,  CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, CmEventosCadastro,
  ImgList;




type
  TfrmCadConfigTransfPlano = class(TfrmCadMestreDetalheCS)
    dbedTitulo: TwwDBEdit;
    qryRegra: TwwQuery;
    updDet: TUpdateSQL;
    dbedCodigoCargoExt: TDBEdit;
    Label2: TLabel;
    lblCodigo: TLabel;
    Label1: TLabel;
    dbedDescInput: TDBEdit;
    lblCampoRegra: TLabel;
    dbedOrdem: TDBEdit;
    lblRegraCalc: TLabel;
    dblkpcmbRegraCalc: TwwDBLookupCombo;
    qryDet: TwwQuery;
    Label3: TLabel;
    wwDBEdit1: TwwDBEdit;
    qryTipoDado: TwwQuery;
    Label15: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label4: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmCadConfigTransfPlano: TfrmCadConfigTransfPlano;

implementation

uses FPrincipal, UDataBase, UMensErro, USistema, UAdmPrev;

{$R *.DFM}

procedure TfrmCadConfigTransfPlano.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count <=  0) or (MontaSelect.ValoresChave[0] = '')
  then Exit;

  qry.Close;
  qry.ParamByName('IDEVENTOGERADOR').Value   := StrToInt(MontaSelect.ValoresChave[0]);
  qry.ParamByName('IDTIPOTRANSF').Value      := StrToInt(MontaSelect.ValoresChave[1]);
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDEVENTOGERADOR').Value    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
  qryDet.ParamByName('IDTIPOTRANSF').Value       := qry.FieldByName('IDTIPOTRANSF').AsInteger;
  qryDet.Open;
end;


procedure TfrmCadConfigTransfPlano.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
   try
      AplicaAlteracoes([qryDet])
   except
      raise;
   end;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmCadConfigTransfPlano.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;

end; 


procedure TfrmCadConfigTransfPlano.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDEVENTOGERADOR').Value   := 0;
  qry.ParamByName('IDTIPOTRANSF').Value      := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDEVENTOGERADOR').Value   := 0;
  qryDet.ParamByName('IDTIPOTRANSF').Value      := 0;
  qryDet.Open;

  qryRegra.Close;
  qryRegra.Open;

  qryTipoDado.Close;
  qryTipoDado.Open;
end;

procedure TfrmCadConfigTransfPlano.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dbedDescInput.Text = '' then
  begin
    MsgDlg('Descrição da Configuração não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    dbedDescInput.SetFocus;
    Abort;
  end;

  if dbedOrdem.Text = '' then
  begin
    MsgDlg('Ordem da Configuração não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    dbedDescInput.SetFocus;
    Abort;
  end;

  if qryDet.State = dsInsert then
  begin
    qryDet.FieldByName('IDEVENTOGERADOR').AsInteger    := qry.FieldByName('IDEVENTOGERADOR').AsInteger;
    qryDet.FieldByName('IDTIPOTRANSF').Value           := qry.FieldByName('IDTIPOTRANSF').AsInteger;
    qryDet.FieldByName('IDCONFIG').AsInteger           := LeUltRegistro(nil, 'CONFIGTRANSFPLANO');
  end;
end;

procedure TfrmCadConfigTransfPlano.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('EVENTOGERADOR.IDFUNDACAO = '+IntToStr(iIdFundacao));
end;

end.
