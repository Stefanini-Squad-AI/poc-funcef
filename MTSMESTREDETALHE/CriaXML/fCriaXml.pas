unit fCriaXml;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Provider, Db, DBClient, StdCtrls, Grids, DBGrids, 
  uCmTypes, ComObj, uCMClientDataSet;

Const
  CONNECTIONSTRING = 'Provider=MSDAORA.1;Password=cmsol;User ID=cm;Data Source=CM;Persist Security Info=True';

type
  TFrmCriaXml = class(TForm)
    DsMestre: TDataSource;
    MemMestre: TMemo;
    MemDetalhe: TMemo;
    BtnInsere: TButton;
    BtnExcluir: TButton;
    BtnBusca: TButton;
    GrdMestre: TDBGrid;
    CdsMestre: TCMClientDataSet;
    CdsDetalhe: TCMClientDataSet;
    DsDetalhe: TDataSource;
    GrdDetalhe: TDBGrid;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    BtnProcessarGrids: TButton;
    procedure BtnInsereClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnBuscaClick(Sender: TObject);
    procedure BtnProcessarGridsClick(Sender: TObject);
  private
    { Private declarations }

    sMensagem: WideString;
    iIdTbMestre: Integer;

    function GetIdTabela: Boolean;
  public
    { Public declarations }
  end;

var
  FrmCriaXml: TFrmCriaXml;

implementation

{$R *.DFM}

Uses uCMDialogs, uMidasUtil;


procedure TFrmCriaXml.BtnInsereClick(Sender: TObject);
Var
   {**
     > A conexão com o MTSObject é feita atraves de um OleVariant que é um
       tipo que querepesenta Variants compartiveis com o COM.
     > Ela deve ser local a procedure para garantir que o objeto instanciado
       no COM+ não fique "preso" pela aplicação cliente de forma que ele só
       é utizado durante a execução do processo local a procedure.
   **}
   oMtsMestreDetalhe: OleVariant;
begin
   {**
     > O Método CreateOleObject abre a conexão com o objeto registrado no
       COM +. O parâmetro representa o nome da Active Server Libary (dll)
       segui do nome do MTS Object criado.
     > A partir daí a chamada aos métodos é feita da mesmo forma que a
       aplicação servidora com o MIDAS
   **}
   oMtsMestreDetalhe := CreateOleObject('MtsMestreDetalhe.ObjMestreDetalhe');
   if (not oMtsMestreDetalhe.ProcessaXml(sMensagem, MemMestre.Lines.Text, MemDetalhe.Lines.Text, 1, CONNECTIONSTRING, True)) then
      showMessage(sMensagem);
end;

procedure TFrmCriaXml.BtnExcluirClick(Sender: TObject);
Var
   {**
     > A conexão com o MTSObject é feita atraves de um OleVariant que é um
       tipo que querepesenta Variants compartiveis com o COM.
     > Ela deve ser local a procedure para garantir que o objeto instanciado
       no COM+ não fique "preso" pela aplicação cliente de forma que ele só
       é utizado durante a execução do processo local a procedure.
   **}
   oMtsMestreDetalhe: OleVariant;
begin
   {**
     > O Método CreateOleObject abre a conexão com o objeto registrado no
       COM +. O parâmetro representa o nome da Active Server Libary (dll)
       segui do nome do MTS Object criado.
     > A partir daí a chamada aos métodos é feita da mesmo forma que a
       aplicação servidora com o MIDAS
   **}
   oMtsMestreDetalhe := CreateOleObject('MtsMestreDetalhe.ObjMestreDetalhe');
   {**
     > O método GetIdTabela exibe uma caixa de diálogo utilizada para
       entrada do valor do Identificador do registro a ser excluído ou
       para a busca de um registro no banco respectivamento nos métodos
       ExcluiMestreDet e GetXml do nosso MTS Object
   **}
   if GetIdTabela And
      (not oMtsMestreDetalhe.ExcluiMestreDet(sMensagem, iIdTbMestre, CONNECTIONSTRING, True)) then
      showMessage(sMensagem);
end;

procedure TFrmCriaXml.BtnBuscaClick(Sender: TObject);
Var
   {**
     > Essas variáveis serão utilzadas como parâmetros do método GetXml
       para retorno do registro selecionado. Esse retorno, em formato Xml,
       é em seguida atribuido aos ClientDataSet´s da tela pelo método
       XmlToCds da uMidasUtil
   **}
   XmlMestre, XmlDetalhe: String;
   {**
     > A conexão com o MTSObject é feita atraves de um OleVariant que é um
       tipo que querepesenta Variants compartiveis com o COM.
     > Ela deve ser local a procedure para garantir que o objeto instanciado
       no COM+ não fique "preso" pela aplicação cliente de forma que ele só
       é utizado durante a execução do processo local a procedure.
   **}
   oMtsMestreDetalhe: OleVariant;
begin
   {**
     > O Método CreateOleObject abre a conexão com o objeto registrado no
       COM +. O parâmetro representa o nome da Active Server Libary (dll)
       segui do nome do MTS Object criado.
     > A partir daí a chamada aos métodos é feita da mesmo forma que a
       aplicação servidora com o MIDAS
   **}
   oMtsMestreDetalhe := CreateOleObject('MtsMestreDetalhe.ObjMestreDetalhe');
   {**
     > O método GetIdTabela exibe uma caixa de diálogo utilizada para
       entrada do valor do Identificador do registro a ser excluído ou
       para a busca de um registro no banco respectivamento nos métodos
       ExcluiMestreDet e GetXml do nosso MTS Object
   **}
   if GetIdTabela then
   begin
     if oMtsMestreDetalhe.GetXml(sMensagem, XmlMestre, XmlDetalhe, iIdTbMestre, CONNECTIONSTRING) then
     begin
        {**
          Atribuição dos Xml´s contidos nas strings XmlMestre, XmlDetalhe aos
          ClientDataSet´s da Tela para visualização dos dados 
        **}
        XmlToCds(XmlMestre, CdsMestre);
        XmlToCds(XmlDetalhe, CdsDetalhe);

        BtnProcessarGrids.Enabled := CdsMestre.Active And CdsDetalhe.Active;
     end
     else
        showMessage(sMensagem);
   end;
end;

function TFrmCriaXml.GetIdTabela: Boolean;
begin
   result := InputValue('Procurar', 'Digite o Identificador da tabela Mestre', iIdTbMestre);
end;

procedure TFrmCriaXml.BtnProcessarGridsClick(Sender: TObject);
Var
   {**
     > A conexão com o MTSObject é feita atraves de um OleVariant que é um
       tipo que querepesenta Variants compartiveis com o COM.
     > Ela deve ser local a procedure para garantir que o objeto instanciado
       no COM+ não fique "preso" pela aplicação cliente de forma que ele só
       é utizado durante a execução do processo local a procedure.
   **}
   oMtsMestreDetalhe: OleVariant;
begin
   {**
     > O Método CreateOleObject abre a conexão com o objeto registrado no
       COM +. O parâmetro representa o nome da Active Server Libary (dll)
       segui do nome do MTS Object criado.
     > A partir daí a chamada aos métodos é feita da mesmo forma que a
       aplicação servidora com o MIDAS
   **}
   oMtsMestreDetalhe := CreateOleObject('MtsMestreDetalhe.ObjMestreDetalhe');
   {**
     > Processa os registros contidos nos ClientDataSets selecionados pelo
       método GetXml do botão "Busca". Este processamento é semelhante a do
       processamento do GetXml no botão "Processa" só que o Xml passado pelo
       parâmetro é montado diretamente a partir dos ClientDatase´s utilizando
       a função CdsToXmlString da uMidasUtil.
   **}
   if (not oMtsMestreDetalhe.ProcessaXml(sMensagem, CdsToXmlString(CdsMestre), CdsToXmlString(CdsDetalhe), 1, CONNECTIONSTRING, True)) then
      showMessage(sMensagem)
   Else
   begin
      CdsMestre.Close;
      CdsDetalhe.Close;
   end;
end;

end.


