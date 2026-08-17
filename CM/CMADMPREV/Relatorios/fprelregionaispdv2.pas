// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FpRelRegionaisPdv2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Mask, wwdblook;

type
  TFrmParamRelPdvReg2 = class(TfrmOkCancelar)
    Label1: TLabel;
    dblckPatro: TwwDBLookupCombo;
    Label2: TLabel;
    sMesCob: TMaskEdit;
    qryPatro: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sMesCobraAux : string;
  public
    { Public declarations }
  end;

var
  FrmParamRelPdvReg2: TFrmParamRelPdvReg2;

implementation

uses UDataBase, UMensErro, FTelaAut, DBaseDados, DRelatAdmPrev, UAdmPrev;

{$R *.DFM}

procedure TFrmParamRelPdvReg2.bbtnConfirmarClick(Sender: TObject);
begin

 if dblckPatro.Text = ''
  then begin
     MsgDlg('O Patrocinadora não foi informada.','Informação',mtInformation,[mbOk,mbHelp],0);
     dblckPatro.SetFocus;
     Exit;
  end;

  if sMesCob.Text = ''
  then begin
     MsgDlg('O mês de referência não foi informado.','Informação',mtInformation,[mbOk,mbHelp],0);
     sMesCob.SetFocus;
     Exit;
  end;

  inherited;

  sMesCobraAux := Copy(sMesCob.Text,4,4)+'/'+Copy(sMesCob.Text,1,2);

  try
        dtmRelatAdmPrev.qryFundacao.Close;
        dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger;
        dtmRelatAdmPrev.qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
        dtmRelatAdmPrev.qryFundacao.Prepare;
        dtmRelatAdmPrev.qryFundacao.Open;
        dtmRelatAdmPrev.rpRegionaisPdv2Label5.text := sMesCob.Text;
        dtmRelatAdmPrev.rpRegionaisPdv2lblPatro.text := dblckPatro.Text;

        dtmRelatAdmPrev.qryRegionaisPdv2.Close;
        dtmRelatAdmPrev.qryRegionaisPdv2.ParamByName('MESCOB').AsString   := sMesCobraAux;
        dtmRelatAdmPrev.qryRegionaisPdv2.ParamByName('IDPATRO').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
        dtmRelatAdmPrev.qryRegionaisPdv2.Open;

        if dtmRelatAdmPrev.qryRegionaisPdv2.IsEmpty
        then begin
             dtmRelatAdmPrev.qryRegionaisPdv2.Close;
             MsgDlg('Não encontrou participantes em PDV nesta patrocinadora.','Informação',mtInformation,[mbOk,mbHelp],0);
             Exit;
        end;

  except
  end;
end;

procedure TFrmParamRelPdvReg2.FormCreate(Sender: TObject);
begin
  inherited;
   qryPatro.Close;
   qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
   qryPatro.Open;
end;

procedure TFrmParamRelPdvReg2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
end;

end.
