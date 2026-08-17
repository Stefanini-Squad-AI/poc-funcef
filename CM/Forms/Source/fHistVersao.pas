unit fHistVersao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, MSXML_TLB, uSistema;

const cNomeArquivoXML = 'HistVersao.xml';

type
  TfrmHistVersao = class(TfrmSairAjuda)
    grdHistVersao: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistVersao: TfrmHistVersao;

implementation

{$R *.DFM}

procedure TfrmHistVersao.FormCreate(Sender: TObject);
var
  xml: TDOMDocument;
  x, i, z: integer;
  node: IXMLDOMNode;
  ListSistema, List: IXMLDOMNodeList;
  sNomeArquivoXML : String;
  sPath : String;
begin
  inherited;
  x:= 0;
  grdHistVersao.Cells[0,0] := 'Versão';
  grdHistVersao.Cells[1,0] := 'Arquivo alterado';
  grdHistVersao.Cells[2,0] := 'Nº SOL';
  grdHistVersao.Cells[3,0] := 'Nº Kintana';
  grdHistVersao.Cells[4,0] := 'Descrição da Solicitação';
  grdHistVersao.Cells[5,0] := 'Data de Envio da Versão';
  sPath := ExtractFilePath(Application.ExeName); 
  sNomeArquivoXML := sPath + 'Alt\' + cNomeArquivoXML;
  If Not FileExists(sNomeArquivoXML) then
  begin
    Application.MessageBox(pChar('O Arquivo '+sNomeArquivoXml+ ' não foi encontrado!'),
                           'Atenção',
                           MB_ICONWARNING+MB_OK);
    exit;
  end;
  try
    xml := TDOMDocument.Create(nil);
    xml.Load(sNomeArquivoXml);
    node := xml.documentElement.Get_firstChild;//Área
    if node.hasChildNodes then //No caso, Sistema...
    begin
      ListSistema := xml.documentElement.getElementsByTagName('sistema');
      for i := 0 to ListSistema.Length -1 do
      begin
        if (ListSistema.Item[i].firstChild.Text = Sistema.NomeAplicativo) then
        begin
          x := x + 1;
          if i >= 1 then
            grdHistVersao.RowCount := grdHistVersao.RowCount + 1;
          grdHistVersao.Cells[0,  x] := ListSistema.item[i].firstChild.Text;
          List:= xml.documentElement.lastChild.childNodes.item[i].Get_childNodes;
          for z := 1 to List.length -1 do
            grdHistVersao.Cells[z -1, x] := ListSistema.item[i].childNodes.Item[z].Get_text;
        end;
      end;
    end;
  finally
    FreeAndNil(xml);
  end;
end;

end.
