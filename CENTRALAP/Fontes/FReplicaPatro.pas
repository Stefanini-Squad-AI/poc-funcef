unit FReplicaPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcTreeView, Db, DBTables, Wwquery;

type
  {Tipo identificador do evento ReplicaRelacionamento}
  TReplicaRelacionamentos = procedure (idPatroDestino: LongInt) of Object;

  {Form ultilizado para replicação dos relacionamento envolvendo patrocidadora.
   Ultilizado nos cadastros de:
   * Situação X Benefício;
   * Termos X Benefício;
   * Documentos X Benefício.}
  TFrmReplicaPatro = class(TfrmOkCancelar)
    LblPatro: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    TreePatro: TfcTreeView;
    qryPatrocinadora: TwwQuery;
    qryPatrocinadoraIDPESSOA: TFloatField;
    qryPatrocinadoraNOME: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    {médoto identificador do evento ReplicaRelacionamentos}
    fReplicaRelacionamentos: TReplicaRelacionamentos;
  public
    {Partocinadora origem para replicação}
    idPatroOrigen :LongInt;
    {Evento a ser atribuído pelo cadastro chamador da replicaçao e escrito de
    forma a contemplar a estrutura da tabela para qual será replicado}
    Property ReplicaRelacionamentos:TReplicaRelacionamentos read fReplicaRelacionamentos write fReplicaRelacionamentos;
    {Procedure que dispara o evento ReplicaRelacionamentos}
    Procedure DoReplicaRelacionamentos(idPatroDestino: LongInt);
    {Lista Patrocinadoras para replicação do cadastro excluindo a patrocinadora
    indicada no cadastro a ser replicado e informada em idPatroOrigem}
    Procedure MontaListaPatro;
  end;

var
  FrmReplicaPatro: TFrmReplicaPatro;

implementation

uses FPrincipal;

{$R *.DFM}

Procedure TFrmReplicaPatro.MontaListaPatro;
Var
  NoPatro :TfcTreeNode;
Begin
   with qryPatrocinadora Do
   Begin
      TreePatro.Items.Clear;
      If Active Then Close;
      Open;
      While Not Eof Do
      Begin
         If qryPatrocinadoraIDPESSOA.AsInteger <> idPatroOrigen Then
         Begin
           NoPatro := TreePatro.Items.Add(nil,qryPatrocinadoraNOME.AsString);
           NoPatro.StringData := qryPatrocinadoraIDPESSOA.AsString;
           NoPatro.CheckboxType := tvctCheckbox;
         End
         Else
            LblPatro.Caption := 'Replica os Relacionamentos da Patrocinadora ' +
                                qryPatrocinadoraNOME.AsString +
                                ' para a(s) selecionada(s) abaixo.';
         Next;
      End;
      Close;
   End;
End;

procedure TFrmReplicaPatro.bbtnConfirmarClick(Sender: TObject);
Var
  X:Integer;
begin
  inherited;
  For X:=0 To TreePatro.Items.Count - 1 Do
      If TreePatro.Items[x].Checked Then DoReplicaRelacionamentos(StrToIntDef(TreePatro.Items[x].Stringdata,0));
      
  ModalResult := MrOk;
  Close;
end;

Procedure TFrmReplicaPatro.DoReplicaRelacionamentos(idPatroDestino: LongInt);
Begin
   If Assigned(fReplicaRelacionamentos) Then fReplicaRelacionamentos(idPatroDestino);
End;

end.
