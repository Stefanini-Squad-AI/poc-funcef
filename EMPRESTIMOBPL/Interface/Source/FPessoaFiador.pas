{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FPessoaFiador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, MontaSelect, DBTables, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97, StdCtrls, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, checklst, ExtCtrls,
  TabControlDetalhe, wwdblook, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Wwdotdot, Wwdbcomb, TREdit;

type
  TfrmPessoaFiador = class(TfrmPessoa)
    qrySubTipoIDAVALISTA: TFloatField;
    wwDBComboBox1: TwwDBComboBox;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    tbsAvalista: TTabSheet;
    qrySubTipoORIGEMREND: TStringField;
    qrySubTipoRENDACOMP: TFloatField;
    qrySubTipoMARGEMCONSIG: TFloatField;
    Label2: TLabel;
    dbEdOrigRend: TDBEdit;
    Label3: TLabel;
    dbEdRendaComp: TDBEdit;
    Label4: TLabel;
    dbEdNMargemConsig: TDBEdit;
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoaFiador: TfrmPessoaFiador;

implementation

uses FCadInscricao,
     UMensErro;      (* MsgDlg *)

{$R *.DFM}



procedure TfrmPessoaFiador.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   Accept := True;
   case pgctrlDetalhe.ActivePageIndex of
        0 {Documentos } : begin
                             if edDocNumDocumento.Text = '' then begin
                                MsgDlg('Favor Informar o documento do avalista!','Empréstimo',mtError,[mbOk],0);
                                Accept := False;
                             end;
                          end;

        1 {Endereços}   : begin
                             if dsEndereco.DataSet.IsEmpty then begin
                                MsgDlg('Favor Informar endereço do Avalista!','Empréstimo',mtError,[mbOk],0);
                                Accept := False;
                             end;
                          end;

        4 {Avalistas}   : begin
                             if dsSubTipo.DataSet.FieldByName('RENDACOMP').isNull then begin
                                MsgDlg('Favor Informar a renda!','Empréstimo',mtError,[mbOk],0);
                                Accept := False;
                             end;
                          end;
   end;
  inherited;

end;



procedure TfrmPessoaFiador.bbtnConfirmarClick(Sender: TObject);
var bOk : Boolean;
begin
   if edDocNumDocumento.Text = '' then begin
      MsgDlg('Favor Informar o documento do avalista!','Empréstimo',mtError,[mbOk],0);
      bOk := False;
   end;
   if dsEndereco.DataSet.IsEmpty then begin
      MsgDlg('Favor Informar endereço do Avalista!','Empréstimo',mtError,[mbOk],0);
      bOk := False;
   end;
   if dsSubTipo.DataSet.FieldByName('RENDACOMP').isNull then begin
      MsgDlg('Favor Informar a renda!','Empréstimo',mtError,[mbOk],0);
      bOk := False;
   end;
   if not bOk then Exit;
   inherited;
end;



end.
