unit FCarregaTabua;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet,
  Wwdatsrc, uCmControlObject, dBaseDados, uSistema;

type
  TFrmCarregaTabua = class(TfrmOkCancelar)
    Panel1: TPanel;
    wwdblkpTabMasculino: TwwDBLookupCombo;
    wwdblkpTabFeminino: TwwDBLookupCombo;
    wwdblkpTabPensao: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmcdsTabMasculino: TCMClientDataSet;
    cmcdsFeminino: TCMClientDataSet;
    cmcdsTabPensao: TCMClientDataSet;
    wwdsTabMasculino: TwwDataSource;
    wwdsTabFeminino: TwwDataSource;
    wwdsTabPensao: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iTabMasculino, iTabFeminino, iTabPensao:Integer;
  end;

var
  FrmCarregaTabua: TFrmCarregaTabua;

implementation

uses fExecutaRegra;

{$R *.DFM}

procedure TFrmCarregaTabua.FormCreate(Sender: TObject);
Var sqlTabMasculino, sqlTabFeminino, sqlTabPensao:String;
    CtrlObjectLocal : TCmControlObject;
begin
   inherited;

   iTabPensao    := 0;
   iTabFeminino  := 0;
   iTabMasculino := 0;

   Try
     CtrlObjectLocal := TCmControlObject.Create;

     CtrlObjectLocal.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer,
                                True, Nil );

      sqlTabMasculino := 'Select * from FI_TABUA_COMUTACAO ' +
                         'where IR_VERSAO_COMUTACAO in ( '   +
                         QuotedStr('N') + ', ' +
                         QuotedStr('A') + ') ' +
                         'order by DS_VERSAO_COMUTACAO ';

      sqlTabFeminino  := 'Select * from FI_TABUA_COMUTACAO ' +
                         'where IR_VERSAO_COMUTACAO in ( '   +
                         QuotedStr('N') + ', ' +
                         QuotedStr('A') + ') ' +
                         'order by DS_VERSAO_COMUTACAO ';

      sqlTabPensao    := 'Select * from FI_TABUA_COMUTACAO ' +
                         'where IR_VERSAO_COMUTACAO in ( '   +
                         QuotedStr('P') + ') ' +
                         'order by DS_VERSAO_COMUTACAO ';

      { Configuração do wwDBLookkup }                   
      wwdblkpTabMasculino.Selected.Text := 'DS_VERSAO_COMUTACAO	100	Versão da Tabela de Comutação	F';
      wwdblkpTabFeminino.Selected.Text  := 'DS_VERSAO_COMUTACAO	100	Versão da Tabela de Comutação	F';
      wwdblkpTabPensao.Selected.Text    := 'DS_VERSAO_COMUTACAO	100	Versão da Tabela de Comutação	F';

      cmcdsTabMasculino.Data := CtrlObjectLocal.GetDataPacket( sqlTabMasculino );
      cmcdsFeminino.Data     := CtrlObjectLocal.GetDataPacket( sqlTabFeminino  );
      cmcdsTabPensao.Data    := CtrlObjectLocal.GetDataPacket( sqlTabPensao    );
  Finally
     FreeAndNil( CtrlObjectLocal );
  End;

end;

procedure TFrmCarregaTabua.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   If wwdblkpTabMasculino.Text <> '' then
      iTabMasculino := cmcdsTabMasculino.FieldbyName('SQ_VERSAO_COMUTACAO').AsInteger;

   If wwdblkpTabFeminino.Text <> '' then
      iTabFeminino  := cmcdsFeminino.FieldbyName('SQ_VERSAO_COMUTACAO').AsInteger;

   If wwdblkpTabPensao.Text <> '' then
      iTabPensao    := cmcdsTabPensao.FieldbyName('SQ_VERSAO_COMUTACAO').AsInteger;

   Close;
end;

procedure TFrmCarregaTabua.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   iTabMasculino := 0;
   iTabFeminino  := 0;
   iTabPensao    := 0;

   bbtnSairClick(Self);
end;

end.
