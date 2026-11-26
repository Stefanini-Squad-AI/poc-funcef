// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FParamRelPdvGeral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Mask;

type
  TfrmParamRelPdvGeral = class(TfrmOkCancelar)
    Label1: TLabel;
    bdlckcmbPatro: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    Label2: TLabel;
    edMesRef: TMaskEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelPdvGeral: TfrmParamRelPdvGeral;

implementation

uses DRelatAdmPrev, UMensErro, UAdmPrev, fAguarde, UFuncoesUteis;

{$R *.DFM}

procedure TfrmParamRelPdvGeral.bbtnConfirmarClick(Sender: TObject);
begin
  if edMesRef.Text = '' then
  begin
     MsgDlg('Selecione o Mês de Referência.','Erro',mtError,[mbOk,mbHelp],0);
     edMesRef.SetFocus;
     Exit;
  end;

  if bdlckcmbPatro.Text = '' then
  begin
     MsgDlg('Selecione a Patrocinadora.','Erro',mtError,[mbOk,mbHelp],0);
     bdlckcmbPatro.SetFocus;
     Exit;
  end;

  try
    StrToDate('01/'+Copy(edMesRef.Text,1,2)+'/'+Copy(edMesRef.Text,4,4))
  except
     MsgDlg('Mês de Referência Inválido. Informe "MM/AAAA" !','Erro',mtError,[mbOk,mbHelp],0);
     edMesRef.SetFocus;
     Exit;
  end;

  inherited;

  with dtmRelatAdmPrev do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     // Preencher endereco da fundacao
     qryPdvGeral.Close;
     qryPdvGeral.ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
     qryPdvGeral.ParamByName('MESREF').AsString     := Copy(Trim(edMesRef.Text),4,4)+'/'+Copy(Trim(edMesRef.Text),1,2);
     frmAguarde.Mostra('Processando consulta ...');
     qryPdvGeral.Open;

     if qryPdvGeral.IsEmpty
     then MsgDlg('Nenhum registro encontrado !!','Atenção',mtWarning,[mbOk,mbHelp],0);
     lblMesRefPDVGeral.Caption := RetornaNomeMes(StrToInt(Copy(Trim(edMesRef.Text),1,2)))+' de '+ Copy(Trim(edMesRef.Text),4,4);
     frmAguarde.Apaga;
  end;

  frmAguarde.Apaga;
end;

procedure TfrmParamRelPdvGeral.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;

  dtmRelatAdmPrev.qryPdvGeral.ParamByName('IDPESSJUR').AsInteger := -1;
  dtmRelatAdmPrev.qryPdvGeral.ParamByName('MESREF').AsString     := '';
end;

procedure TfrmParamRelPdvGeral.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bdlckcmbPatro.Text := '';
  edMesRef.Text      := '';
end;

end.

