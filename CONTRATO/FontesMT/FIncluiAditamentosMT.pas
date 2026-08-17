{-------------------------------------------------------------------------------
----------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------
--------------------------------------------------------------------------------
N. SIG..........: 121740
Data............: 16/12/2021
Responsável.....: Everson Cunha
Descrição.......: Aumentar o tamanho do campo "Descrição do Aditamento"
--------------------------------------------------------------------------------}

unit FIncluiAditamentosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Mask, DBCtrls, wwdbdatetimepicker, CMDateTimePicker,
  StdCtrls, Db, Wwdatsrc, DBClient, uCMClientDataSet, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmIncluiditamentosMT = class(TfrmOkCancelar)
    cdsAditamento: TCMClientDataSet;
    dsAditamento: TwwDataSource;
    dbeDescricaoAditamento: TDBMemo;
    Panel2: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    edDataAditamento: TCMDateTimePicker;
    dbeCodigoAditamento: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncluiditamentosMT: TfrmIncluiditamentosMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmIncluiditamentosMT.FormShow(Sender: TObject);
begin
   inherited;
   cdsAditamento.Insert;
end;

procedure TfrmIncluiditamentosMT.bbtnConfirmarClick(Sender: TObject);
begin
   if (Trim(edDataAditamento.Text)='') then
    begin
       MsgDlg('A Data do Aditamento não pode ser deixada em Branco','Erro',mtError,[mbOK],0);
       edDataAditamento.SetFocus;
       Abort;
    end;

   if (Trim(dbeCodigoAditamento.Text)='') then
    begin
       MsgDlg('A Código do Aditamento não pode ser deixada em Branco','Erro',mtError,[mbOK],0);
       dbeCodigoAditamento.SetFocus;
       Abort;
    end;

   if (Trim(dbeDescricaoAditamento.Text)='') then
    begin
       MsgDlg('A Descrição do Aditamento não pode ser deixada em Branco','Erro',mtError,[mbOK],0);
       dbeDescricaoAditamento.SetFocus;
       Abort;
    end;

   cdsAditamento.Post;
   inherited;
end;

end.
