unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniLabel,
  uniMemo, uniHTMLMemo, uniPanel, uniButton;

type
  TMainForm = class(TUniForm)
    HtmlMemo: TUniHTMLMemo;
    UniPanel1: TUniPanel;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    procedure UniFormCreate(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
begin
  HtmlMemo.Lines.SaveToFile(ExtractFileDir(Application.ExeName) + '\conteudo.bin');
end;

procedure TMainForm.UniButton2Click(Sender: TObject);
begin
  HtmlMemo.Lines.LoadFromFile(ExtractFileDir(Application.ExeName) + '\conteudo.bin');
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
var
  s: string;
begin
  HtmlMemo.ClientEvents.ExtEvents.Clear;

  // initialize
  s:= 'initialize=function initialize(sender, eOpts) '+
      '{ '+

      // dblclick
      '  sender.getDoc().addEventListener(''dblclick'', function() '+
      '  { '+
      '    if (arguments[0].target && arguments[0].target.tagName.toLowerCase()==''img'') '+
      '    { '+
      '      ajaxRequest(sender, ''_img_'', ["id="+arguments[0].target.getAttribute(''id'')]); '+
      '    } '+
      '    if (arguments[0].target && arguments[0].target.tagName.toLowerCase()==''td'') '+
      '    { '+
      '      ajaxRequest(sender, ''_table_'', ["id="+arguments[0].target.getAttribute(''id'')]); '+
      '    } '+
      '  }); '+

      // keydown
      '  sender.iframeEl.dom.contentDocument.body.addEventListener(''keydown'', function(e) '+
      '  { '+
      '    if( (e.ctrlKey && e.key === ''v'') || (e.ctrlKey && e.key === ''V'') ) '+
      '    { '+
      //'      alert(''Key''); '+
      '    } '+
      '  }); '+

      // paste
      '  sender.iframeEl.dom.contentDocument.body.addEventListener(''paste'', function(e) '+
      '  { '+
      '    var items = e.clipboardData.items; '+
      '    if(items.length === 1) '+
      '    { '+
      '      var str = items[0].type; '+
      '      if(str.indexOf("image") !== -1) '+
      '      { '+
      //'        alert(str); '+
      '        var oldData = e.clipboardData.getData(); '+
      '        var len = length(oldData)-4; '+
      '        var index = oldData.indexOf("<img"); '+
      //       I need to scan oldData and insert id, width and height
      '        var newData = slice(oldData, 1, index+4) + '' id="img09" width="25" height="25" '' + slice(oldData, index+4, len); '+
      '        pasteClipboardData(newData); '+
      '        e.preventDefault(); '+
      '      } '+
      '    } '+
      '  }); '+

      '} ';
  HtmlMemo.ClientEvents.ExtEvents.Add(s);
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
