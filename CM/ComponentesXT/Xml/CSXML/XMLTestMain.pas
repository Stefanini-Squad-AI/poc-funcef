unit XMLTestMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, XMLReader, XMLWriter;

type
  TfrmXMLTestDemo = class(TForm)
    tvNodes: TTreeView;
    btnOpen: TButton;
    btnFullExpand: TButton;
    lblTimeToRun: TLabel;
    opdXMLFile: TOpenDialog;
    btnWriteTest: TButton;
    svdXMLFile: TSaveDialog;
    procedure btnOpenClick(Sender: TObject);
    procedure btnFullExpandClick(Sender: TObject);
    procedure btnWriteTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddNodesToTree(Node: TXMLNode; TreeNode: TTreeNode);
  end;

var
  frmXMLTestDemo: TfrmXMLTestDemo;

implementation

{$R *.DFM}

uses
  StrLib;

procedure TfrmXMLTestDemo.AddNodesToTree(Node: TXMLNode; TreeNode: TTreeNode);
var
  i: Integer;
begin
  for i := 0 to Pred(Node.NodeCount) do begin
    AddNodesToTree(Node.Nodes[i], tvNodes.Items.AddChild(TreeNode, Node.Nodes[i].Description));
  end;
end;

procedure TfrmXMLTestDemo.btnOpenClick(Sender: TObject);
var
  Node: TXMLNode;
  XMLReader: TXMLStringReader;
  FStream: TFileStream;
  Data: String;
  BeginTime, EndTime, Freq: Int64;
begin
  if not opdXMLFile.Execute then Exit;
  QueryPerformanceCounter(BeginTime);
  FStream := TFileStream.Create(opdXMLFile.FileName, fmOpenRead);
  try
    SetLength(Data, FStream.Size);
    FStream.Read(Data[1], FStream.Size);
  finally
    FStream.Free;
  end;

  XMLReader := TXMLStringReader.Create(Data);
  try
    Node := XMLReader.ParseDocument;
    QueryPerformanceCounter(EndTime);
    QueryPerformanceFrequency(Freq);
    lblTimeToRun.Caption := Format('%.3n ms', [(EndTime - BeginTime) * 1000 / Freq]);
  finally
    XMLReader.Free;
  end;

  //ShowMessage(IntToStr(Node.TotalNodeCount));

  tvNodes.Items.Clear;
  tvNodes.Items.BeginUpdate;
  try
    AddNodesToTree(Node, tvNodes.Items.Add(nil, Node.Description));
  finally
    tvNodes.Items.EndUpdate;
  end;

  Node.Free;
end;

procedure TfrmXMLTestDemo.btnFullExpandClick(Sender: TObject);
begin
  tvNodes.FullExpand
end;

procedure TfrmXMLTestDemo.btnWriteTestClick(Sender: TObject);
var
  XML: TXMLWriter;
begin
  if not svdXMLFile.Execute then Exit;
  // this code is just a simple demo of the TXMLWriter functionality
  XML := TXMLStreamWriter.Create(TFileStream.Create(svdXMLFile.FileName,
      fmCreate), True, True);
  try
    // this example creates a near copy of the sample.xml file used in Charlie
    // Calvert's XML demos which can be found at:
    // http://homepages.borland.com/ccalvert/TechPapers/Delphi/XMLBrowse/index.htm
    XML.StartDoc;
    //XML.WriteStandaloneDocumentDeclaration;
    XML.WriteTag('HTML');
    XML.WriteTag('HEAD');
    XML.WriteBasicData('TITLE', 'Sample XML File');
    XML.WriteTag('HEAD', xttEnding);
    XML.WriteTag('BODY');
    XML.WriteBasicData('P', 'Right under this line I insert an XML data island.');
    XML.WriteTag('XML', xttStarting, True);
    XML.WriteTagParam('ID', 'CDXML');
    XML.WriteTagClose;
    XML.WriteTag('CDS');
    XML.WriteBasicData('CD', 'Two Against Nature');
    XML.WriteBasicData('CD', 'Giant Steps');
    XML.WriteBasicData('CD', 'Round About Midnight');
    XML.WriteBasicData('CD', 'Imaginary Day');
    XML.WriteTag('CDS', xttEnding);
    XML.WriteTag('XML', xttEnding);
    XML.WriteTag('BODY', xttEnding);
    XML.WriteTag('HTML', xttEnding);
    XML.EndDoc;
  finally
    XML.Free;
  end;
end;

end.
